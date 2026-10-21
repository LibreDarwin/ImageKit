/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 */

#import <AppKit/AppKit.h>
#import "ImageKitBase.h"

@class IKCacheDatabaseEntry;
@class IKCacheDatabaseUIDInfo;
@class IKCacheNode;
@class IKIconDatabase;

IK_CLASS_AVAILABLE(10_6)
@interface IKCacheDatabase : NSObject
- (NSMutableArray *)entries;
- (IKIconDatabase *)iconCache;
- (unsigned long long)nextFreeIndex;
- (unsigned long long)lastIndex;
- (IKCacheDatabaseEntry *)entryAtIndex:(unsigned long long)index;
- (unsigned long long)addUID:(id)uid;
- (void)releaseIndex:(unsigned long long)index;
- (void)retainIndex:(unsigned long long)index;
- (void)addReference:(id)uid atIndex:(unsigned long long)index;
- (void)associateUID:(id)uid withIndex:(unsigned long long)index;
- (unsigned long long)cacheVersionForUID:(id)uid;
- (BOOL)entryAtUIDIsValid:(id)uid;
- (NSMutableIndexSet *)freeIndexes;
- (id)imageWithUID:(id)uid;
- (unsigned long long)indexForUID:(id)uid;
- (void)invalidateEntryAtUID:(id)uid;
- (IKCacheNode *)nodeAtIndex:(unsigned long long)index withSize:(int)size;
- (long long)referenceCountAtIndex:(unsigned long long)index;
- (void)removeReference:(id)uid atIndex:(unsigned long long)index;
- (void)resetInternalCacheVersionForUID:(id)uid;
- (void)setCacheVersion:(unsigned long long)version forUID:(id)uid;
- (void)setImage:(id)image withUID:(id)uid;
- (unsigned long long)unshareUID:(id)uid;
- (void)validateEntryAtUID:(id)uid;
@end
