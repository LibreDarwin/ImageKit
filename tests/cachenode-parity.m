/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 *
 * Behavior fixture for IKCacheNode. Loads the framework under test with
 * dlopen() and drives it through a fixed script, emitting one "label<TAB>value"
 * record per observation. Run against Apple's ImageKit and against ours.
 */

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <dlfcn.h>
#import <stdio.h>

@interface IKCacheNode : NSObject
- (id)initWithParent:(id)parent uid:(unsigned long long)uid database:(id)database size:(int)size;
- (unsigned long long)uid;
- (int)size;
- (void)setSize:(int)size;
- (id)thumbnail;
- (void)setThumbnail:(id)thumbnail;
- (id)parent;
- (void)setParent:(id)parent;
- (id)objectForCacheKey:(int)cacheKey;
- (void)setObject:(id)object forCacheKey:(int)cacheKey;
- (void)removeObjectForCacheKey:(int)cacheKey;
- (void)willDie;
@end

@interface FakeDB : NSObject {
@public
    long retainCount;
    long releaseCount;
    unsigned long long lastRetain;
    unsigned long long lastRelease;
}
- (void)retainIndex:(unsigned long long)index;
- (void)releaseIndex:(unsigned long long)index;
@end

@implementation FakeDB
- (void)retainIndex:(unsigned long long)index {
    retainCount++;
    lastRetain = index;
}
- (void)releaseIndex:(unsigned long long)index {
    releaseCount++;
    lastRelease = index;
}
@end

@interface FakeParent : NSObject {
    id _db;
}
- (id)database;
- (void)setDB:(id)db;
@end

@implementation FakeParent
- (id)database { return _db; }
- (void)setDB:(id)db { _db = db; }
@end

@interface TestData : NSObject {
    int _died;
}
- (void)willDie;
- (int)died;
@end

@implementation TestData
- (void)willDie { _died++; }
- (int)died { return _died; }
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
    Class cls = objc_getClass("IKCacheNode");
    if (cls == nil) {
        fprintf(stderr, "IKCacheNode not found\n");
        return 1;
    }

    @autoreleasepool {
        FakeDB *db = [[FakeDB alloc] init];
        FakeParent *parent = [[FakeParent alloc] init];
        [parent setDB:db];

        IKCacheNode *n = [[cls alloc] initWithParent:parent uid:42 database:db size:100];
        emit(@"init|nonNil", nn(n));
        emit(@"init|uid", ull([n uid]));
        emit(@"init|size", i([n size]));
        emit(@"init|parent", same([n parent], parent));
        emit(@"init|thumbNil", nn([n thumbnail]));
        emit(@"init|dbRetain", lng(db->retainCount));
        emit(@"init|dbRetainIdx", ull(db->lastRetain));

        [n setSize:200];
        emit(@"setSize|size", i([n size]));

        TestData *td0 = [[TestData alloc] init];
        [n setThumbnail:td0];
        emit(@"setThumb|is", same([n thumbnail], td0));
        [n setThumbnail:nil];
        emit(@"setThumbNil|nil", nn([n thumbnail]));

        emit(@"key0|nil", nn([n objectForCacheKey:0]));
        emit(@"key1|nil", nn([n objectForCacheKey:1]));
        emit(@"key2|nil", nn([n objectForCacheKey:2]));

        TestData *d0 = [[TestData alloc] init];
        TestData *d1 = [[TestData alloc] init];
        [n setObject:d0 forCacheKey:0];
        emit(@"set0|is", same([n objectForCacheKey:0], d0));
        [n setObject:d1 forCacheKey:1];
        emit(@"set1|is", same([n objectForCacheKey:1], d1));
        [n setObject:d0 forCacheKey:3];
        emit(@"set3|is0Still", same([n objectForCacheKey:0], d0));

        [n removeObjectForCacheKey:0];
        emit(@"rem0|nil", nn([n objectForCacheKey:0]));
        emit(@"rem0|d0died", i([d0 died]));
        emit(@"rem0|d1died", i([d1 died]));
        [n removeObjectForCacheKey:7];
        emit(@"rem7|d1died", i([d1 died]));

        [n willDie];
        emit(@"die|thumbNil", nn([n thumbnail]));
        emit(@"die|uid", ull([n uid]));
        emit(@"die|parentNil", nn([n parent]));
        emit(@"die|d1died", i([d1 died]));
        emit(@"die|dbRelease", lng(db->releaseCount));
        emit(@"die|dbReleaseIdx", ull(db->lastRelease));
    }

    return 0;
}
