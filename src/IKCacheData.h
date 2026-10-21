/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 */

#import <AppKit/AppKit.h>
#import "ImageKitBase.h"

@class IKCacheManager;
@class IKCacheDatabase;
@class IKCacheNode;

IK_CLASS_AVAILABLE(10_6)
@interface IKCacheData : NSObject {
    __unsafe_unretained IKCacheManager *_parent;
    IKCacheDatabase *_db;
    IKCacheNode *_lastRequestedNode;
    int _lastRequestedSize;
    unsigned long long _lastRequestedUID;
}

- (id)init;
- (void)dealloc;
- (IKCacheDatabase *)database;
- (IKCacheManager *)parent;
- (void)setParent:(IKCacheManager *)parent;
- (IKCacheNode *)nodeForUID:(unsigned long long)uid size:(int)size createIfNeeded:(BOOL)createIfNeeded;
- (id)objectWithUID:(unsigned long long)uid withSize:(int)size withKey:(int)key;
- (IKCacheNode *)cacheNodeWithUID:(unsigned long long)uid withSize:(int)size;
- (void)prepareChildsToDie;
- (void)removeCacheNodeWithUID:(unsigned long long)uid withSize:(int)size;
- (void)removeObjectWithUID:(unsigned long long)uid withSize:(int)size withKey:(int)key;
- (BOOL)storeImage:(id)image withUID:(unsigned long long)uid withSize:(int)size;
- (unsigned long long)unshareEntriesWithUIDIfNeeded:(id)uid cacheManager:(id)cacheManager;

@end
