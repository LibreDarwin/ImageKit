/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 *
 * Behavior fixture for IKCacheDatabase. Loads the framework under test with
 * dlopen() and drives it through a fixed script, emitting one "label<TAB>value"
 * record per observation. Run against Apple's ImageKit and against ours.
 */

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <dlfcn.h>
#import <stdio.h>

@interface IKCacheDatabase : NSObject
- (id)init;
- (id)entries;
- (id)freeIndexes;
- (id)iconCache;
- (unsigned long long)nextFreeIndex;
- (unsigned long long)lastIndex;
- (unsigned long long)addUID:(id)uid;
- (id)entryAtIndex:(unsigned long long)index;
- (void)retainIndex:(unsigned long long)index;
- (void)releaseIndex:(unsigned long long)index;
- (void)addReference:(id)uid atIndex:(unsigned long long)index;
- (void)removeReference:(id)uid atIndex:(unsigned long long)index;
- (void)associateUID:(id)uid withIndex:(unsigned long long)index;
- (unsigned long long)unshareUID:(id)uid;
- (unsigned long long)indexForUID:(id)uid;
- (unsigned long long)cacheVersionForUID:(id)uid;
- (void)setCacheVersion:(unsigned long long)version forUID:(id)uid;
- (void)resetInternalCacheVersionForUID:(id)uid;
- (id)imageWithUID:(id)uid;
- (void)setImage:(id)image withUID:(id)uid;
- (BOOL)entryAtUIDIsValid:(id)uid;
- (void)validateEntryAtUID:(id)uid;
- (void)invalidateEntryAtUID:(id)uid;
- (long long)referenceCountAtIndex:(unsigned long long)index;
- (id)nodeAtIndex:(unsigned long long)index withSize:(int)size;
@end

static void emit(NSString *label, NSString *value) {
    printf("%s\t%s\n", label.UTF8String, value.UTF8String);
}

static NSString *u(unsigned long long v) { return [NSString stringWithFormat:@"%llu", v]; }
static NSString *i(long long v) { return [NSString stringWithFormat:@"%lld", v]; }
static NSString *b(BOOL v) { return v ? @"YES" : @"NO"; }
static NSString *nn(id o) { return o == nil ? @"nil" : @"obj"; }
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
    Class cls = objc_getClass("IKCacheDatabase");
    if (cls == nil) {
        fprintf(stderr, "IKCacheDatabase not found\n");
        return 1;
    }

    @autoreleasepool {
        IKCacheDatabase *db = [[cls alloc] init];
        emit(@"init|nonNil", nn(db));
        emit(@"init|entries", nn([db entries]));
        emit(@"init|free", nn([db freeIndexes]));
        emit(@"init|iconCache", nn([db iconCache]));
        emit(@"init|lastIndex", u([db lastIndex]));
        emit(@"init|nextFree", u([db nextFreeIndex]));

        emit(@"empty|indexForUID", u([db indexForUID:@"u1"]));
        emit(@"empty|cacheVersion", u([db cacheVersionForUID:@"u1"]));
        emit(@"empty|isValid", b([db entryAtUIDIsValid:@"u1"]));
        emit(@"empty|refcount", i([db referenceCountAtIndex:NSNotFound]));
        emit(@"empty|entry", nn([db entryAtIndex:NSNotFound]));

        unsigned long long i1 = [db addUID:@"u1"];
        emit(@"add|i1", u(i1));
        emit(@"add|lastIndex", u([db lastIndex]));
        emit(@"add|nextFree", u([db nextFreeIndex]));
        emit(@"add|indexForUID", u([db indexForUID:@"u1"]));
        emit(@"add|entry", nn([db entryAtIndex:i1]));
        emit(@"add|refcount", i([db referenceCountAtIndex:i1]));
        emit(@"add|isValid", b([db entryAtUIDIsValid:@"u1"]));
        emit(@"add|node", nn([db nodeAtIndex:i1 withSize:16]));

        unsigned long long i2 = [db addUID:@"u2"];
        emit(@"add2|i2", u(i2));
        emit(@"add2|lastIndex", u([db lastIndex]));

        [db setCacheVersion:5 forUID:@"u1"];
        emit(@"ver|cacheVersion", u([db cacheVersionForUID:@"u1"]));
        [db resetInternalCacheVersionForUID:@"u1"];
        emit(@"ver|afterReset", u([db cacheVersionForUID:@"u1"]));

        NSObject *img = [[NSObject alloc] init];
        [db setImage:img withUID:@"u1"];
        emit(@"image|is", same([db imageWithUID:@"u1"], img));
        [db setImage:nil withUID:@"u1"];
        emit(@"image|cleared", nn([db imageWithUID:@"u1"]));

        [db invalidateEntryAtUID:@"u1"];
        emit(@"valid|afterInvalidate", b([db entryAtUIDIsValid:@"u1"]));
        [db validateEntryAtUID:@"u1"];
        emit(@"valid|afterValidate", b([db entryAtUIDIsValid:@"u1"]));

        [db addReference:@"u1" atIndex:i1];
        emit(@"ref|count1", i([db referenceCountAtIndex:i1]));

        [db retainIndex:i1];
        emit(@"retain|count", i([db referenceCountAtIndex:i1]));
        [db releaseIndex:i1];
        emit(@"release|entry", nn([db entryAtIndex:i1]));
        emit(@"release|count", i([db referenceCountAtIndex:i1]));

        [db removeReference:@"u1" atIndex:i1];
        emit(@"rm1|count", i([db referenceCountAtIndex:i1]));
        [db removeReference:@"u1" atIndex:i1];
        emit(@"rm2|entry", nn([db entryAtIndex:i1]));
        emit(@"rm2|indexForUID", u([db indexForUID:@"u1"]));
        emit(@"rm2|lastIndex", u([db lastIndex]));

        unsigned long long ns = [db unshareUID:@"u2"];
        emit(@"unshare|newIndex", u(ns));
        emit(@"unshare|indexForUID", u([db indexForUID:@"u2"]));
        emit(@"unshare|lastIndex", u([db lastIndex]));

        emit(@"unknown|indexForUID", u([db indexForUID:@"nope"]));
        emit(@"unknown|cacheVersion", u([db cacheVersionForUID:@"nope"]));
        emit(@"unknown|unshare", u([db unshareUID:@"nope"]));
        emit(@"unknown|refcount", i([db referenceCountAtIndex:NSNotFound]));
        emit(@"unknown|assoc", u((unsigned long long)[db indexForUID:@"u2"]));
        [db associateUID:@"nope" withIndex:0];
        emit(@"unknown|assocDone", @"ok");
    }

    return 0;
}
