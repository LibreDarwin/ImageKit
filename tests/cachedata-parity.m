/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 *
 * Behavior fixture for IKCacheData. Loads the framework under test with
 * dlopen() and drives it through a fixed script, emitting one "label<TAB>value"
 * record per observation. Run against Apple's ImageKit and against ours.
 *
 * Note: -[IKCacheDatabase entryAtIndex:] raises NSRangeException for an index
 * >= the entry count, so every index used here is one returned by -addUID:.
 */

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <dlfcn.h>
#import <stdio.h>

@interface IKCacheData : NSObject
- (id)init;
- (id)database;
- (id)parent;
- (void)setParent:(id)parent;
- (id)nodeForUID:(unsigned long long)uid size:(int)size createIfNeeded:(BOOL)createIfNeeded;
- (id)objectWithUID:(unsigned long long)uid withSize:(int)size withKey:(int)key;
- (id)cacheNodeWithUID:(unsigned long long)uid withSize:(int)size;
- (void)prepareChildsToDie;
- (void)removeCacheNodeWithUID:(unsigned long long)uid withSize:(int)size;
- (void)removeObjectWithUID:(unsigned long long)uid withSize:(int)size withKey:(int)key;
- (BOOL)storeImage:(id)image withUID:(unsigned long long)uid withSize:(int)size;
- (unsigned long long)unshareEntriesWithUIDIfNeeded:(id)uid cacheManager:(id)cacheManager;
@end

@interface IKCacheDatabase : NSObject
- (unsigned long long)addUID:(id)uid;
@end

static void emit(NSString *label, NSString *value) {
    printf("%s\t%s\n", label.UTF8String, value.UTF8String);
}

static NSString *u(unsigned long long v) { return [NSString stringWithFormat:@"%llu", v]; }
static NSString *b(BOOL v) { return v ? @"YES" : @"NO"; }
static NSString *obj(id o) { return o == nil ? @"nil" : @"obj"; }
static NSString *same(id a, id b) { return a == b ? @"1" : @"0"; }

int main(int argc, char **argv) {
    if (argc != 2) {
        fprintf(stderr, "usage: %s <path to ImageKit>\n", argv[0]);
        return 2;
    }
    if (dlopen(argv[1], RTLD_NOW) == NULL) {
        fprintf(stderr, "dlopen(%s) failed: %s\n", argv[1], dlerror());
        return 2;
    }
    Class cls = objc_getClass("IKCacheData");
    if (cls == nil) {
        fprintf(stderr, "IKCacheData not found\n");
        return 1;
    }

    @autoreleasepool {
        IKCacheData *d = [[cls alloc] init];
        emit(@"init|nonNil", obj(d));

        IKCacheData *peer = [[cls alloc] init];
        emit(@"parent|initial", obj([d parent]));
        [d setParent:peer];
        emit(@"parent|afterSet", same([d parent], peer));
        emit(@"database|nonNil", obj([d database]));
        emit(@"database|className", NSStringFromClass([[d database] class]));

        IKCacheDatabase *db = [d database];
        unsigned long long idx = [db addUID:@"a"];
        emit(@"uid|idx", u(idx));

        emit(@"node|size16Initial", obj([d nodeForUID:idx size:16 createIfNeeded:NO]));
        emit(@"store|ret", b([d storeImage:@"imgA" withUID:idx withSize:16]));
        {
            id n1 = [d nodeForUID:idx size:16 createIfNeeded:NO];
            emit(@"node|afterStore", obj(n1));
            emit(@"node|className", n1 == nil ? @"nil" : NSStringFromClass([n1 class]));
            id n2 = [d cacheNodeWithUID:idx withSize:16];
            emit(@"cacheNode|sameAsNode", same(n1, n2));
        }
        emit(@"object|missing", obj([d objectWithUID:idx withSize:16 withKey:0]));
        [d removeObjectWithUID:idx withSize:16 withKey:0];
        emit(@"removeObject|done", @"ok");

        emit(@"node|otherSize", obj([d nodeForUID:idx size:32 createIfNeeded:NO]));

        [d removeCacheNodeWithUID:idx withSize:16];
        emit(@"node|afterRemove", obj([d nodeForUID:idx size:16 createIfNeeded:NO]));
        emit(@"node|afterRemoveOtherSize", obj([d nodeForUID:idx size:32 createIfNeeded:NO]));

        emit(@"node|createOtherSize", obj([d nodeForUID:idx size:32 createIfNeeded:YES]));
        emit(@"store|ret2", b([d storeImage:@"imgB" withUID:idx withSize:32]));
        [d removeCacheNodeWithUID:idx withSize:32];
        emit(@"node|goneAfterRemove2", obj([d nodeForUID:idx size:32 createIfNeeded:NO]));

        [d removeCacheNodeWithUID:idx withSize:64];
        emit(@"removeMissingSize|done", @"ok");

        unsigned long long idx2 = [db addUID:@"b"];
        emit(@"uid2|idx", u(idx2));
        emit(@"node2|initial", obj([d nodeForUID:idx2 size:8 createIfNeeded:NO]));
        emit(@"node2|created", obj([d nodeForUID:idx2 size:8 createIfNeeded:YES]));

        emit(@"unshare|missing", u([d unshareEntriesWithUIDIfNeeded:@"nope" cacheManager:nil]));

        [d prepareChildsToDie];
        emit(@"prepareChildsToDie|done", @"ok");

        d = nil;
        peer = nil;
        emit(@"dealloc|done", @"ok");
    }

    return 0;
}
