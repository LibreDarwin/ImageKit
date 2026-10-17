/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 *
 * Behavior fixture for IKCacheDatabaseEntry. Loads the framework under test
 * with dlopen() and drives it through a fixed script, emitting one
 * "label<TAB>value" record per observation. Run against Apple's ImageKit and
 * against ours, then diff.
 */

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <dlfcn.h>
#import <stdio.h>

@interface IKCacheDatabaseEntry : NSObject
- (NSMutableArray *)uids;
- (void)addUID:(id)uid;
- (void)removeUID:(id)uid;
- (BOOL)isShared;
- (long)dbRetainCount;
- (long)incrDBRetainCount;
- (long)decrDBRetainCount;
- (id)nodeWithSize:(int)size;
- (void)addNode:(id)node withSize:(int)size;
- (void)removeNodeWithSize:(int)size;
- (id)thumbnailWithSize:(int)size;
- (NSUInteger)thumbnailCount;
- (NSIndexSet *)sizes;
@end

@interface TestNode : NSObject {
    id _thumbnail;
}
- (id)thumbnail;
- (void)setThumbnail:(id)t;
@end

@implementation TestNode
- (id)thumbnail { return _thumbnail; }
- (void)setThumbnail:(id)t { _thumbnail = t; }
@end

static void emit(NSString *label, NSString *value) {
    printf("%s\t%s\n", label.UTF8String, value.UTF8String);
}

static NSString *i(int v) { return [NSString stringWithFormat:@"%d", v]; }
static NSString *lng(long v) { return [NSString stringWithFormat:@"%ld", v]; }
static NSString *ull(unsigned long long v) {
    return [NSString stringWithFormat:@"%llu", v];
}
static NSString *same(id a, id b) { return a == b ? @"1" : @"0"; }
static NSString *nn(id o) { return o == nil ? @"nil" : @"obj"; }

int main(int argc, char **argv) {
    if (argc != 2) {
        fprintf(stderr, "usage: %s <path to ImageKit>\n", argv[0]);
        return 2;
    }
    if (dlopen(argv[1], RTLD_NOW) == NULL) {
        fprintf(stderr, "dlopen(%s) failed: %s\n", argv[1], dlerror());
        return 2;
    }
    Class cls = objc_getClass("IKCacheDatabaseEntry");
    if (cls == nil) {
        fprintf(stderr, "IKCacheDatabaseEntry not found\n");
        return 1;
    }

    @autoreleasepool {
        IKCacheDatabaseEntry *d = [[cls alloc] init];
        emit(@"init|uidsNil", nn([d uids]));
        emit(@"init|isShared", i([d isShared]));
        emit(@"init|dbRetainCount", lng([d dbRetainCount]));
        emit(@"init|thumbCount", ull([d thumbnailCount]));
        emit(@"init|nodeNil", nn([d nodeWithSize:5]));
        emit(@"init|sizesCount", ull([[d sizes] count]));
        emit(@"init|sizesClass", NSStringFromClass([[d sizes] class]));

        NSObject *a = [[NSObject alloc] init];
        NSObject *b = [[NSObject alloc] init];
        [d addUID:a];
        emit(@"uidA|count", ull([[d uids] count]));
        emit(@"uidA|isShared", i([d isShared]));
        emit(@"uidA|uidsIsArray", same([d uids], [d uids]));
        [d addUID:b];
        emit(@"uidB|count", ull([[d uids] count]));
        emit(@"uidB|isShared", i([d isShared]));
        [d removeUID:a];
        emit(@"uidRemove|count", ull([[d uids] count]));
        emit(@"uidRemove|isShared", i([d isShared]));

        emit(@"db|incr", lng([d incrDBRetainCount]));
        emit(@"db|incr2", lng([d incrDBRetainCount]));
        emit(@"db|value", lng([d dbRetainCount]));
        emit(@"db|decr", lng([d decrDBRetainCount]));
        emit(@"db|decr2", lng([d decrDBRetainCount]));

        TestNode *n5 = [[TestNode alloc] init];
        TestNode *n5b = [[TestNode alloc] init];
        TestNode *n7 = [[TestNode alloc] init];
        [n5 setThumbnail:@"thumb5"];
        [n5b setThumbnail:@"thumb5b"];
        [n7 setThumbnail:@"thumb7"];

        [d addNode:n5 withSize:5];
        emit(@"add5|count", ull([d thumbnailCount]));
        emit(@"add5|isN5", same([d nodeWithSize:5], n5));
        emit(@"add5|sizesCount", ull([[d sizes] count]));
        emit(@"add5|sizesHas5", i([[d sizes] containsIndex:5]));
        emit(@"add5|sizesClass", NSStringFromClass([[d sizes] class]));

        [d addNode:n5b withSize:5];
        emit(@"replace5|count", ull([d thumbnailCount]));
        emit(@"replace5|isN5b", same([d nodeWithSize:5], n5b));

        [d addNode:n7 withSize:7];
        emit(@"add7|count", ull([d thumbnailCount]));
        emit(@"add7|isN7", same([d nodeWithSize:7], n7));
        emit(@"add7|sizesCount", ull([[d sizes] count]));
        emit(@"add7|sizesHas7", i([[d sizes] containsIndex:7]));

        emit(@"thumb|size5", same([d thumbnailWithSize:5], @"thumb5b"));
        emit(@"thumb|size7", same([d thumbnailWithSize:7], @"thumb7"));
        emit(@"thumb|size9", nn([d thumbnailWithSize:9]));

        [d removeNodeWithSize:5];
        emit(@"rem5|count", ull([d thumbnailCount]));
        emit(@"rem5|nodeNil", nn([d nodeWithSize:5]));
        emit(@"rem5|sizesHas7", i([[d sizes] containsIndex:7]));
        [d removeNodeWithSize:99];
        emit(@"rem99|count", ull([d thumbnailCount]));
    }

    return 0;
}
