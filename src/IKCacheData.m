/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 */

#import "IKCacheData.h"
#import "IKCacheDatabase.h"
#import "IKCacheDatabaseEntry.h"
#import "IKCacheNode.h"

#pragma clang diagnostic ignored "-Wdeprecated-declarations"

@interface IKCacheDatabaseEntry (IKCacheDataInternal)
- (id)nodeWithSize:(int)size;
- (void)addNode:(id)node withSize:(int)size;
- (void)removeNodeWithSize:(int)size;
- (id)thumbnailWithSize:(int)size;
- (NSIndexSet *)sizes;
@end

@interface NSObject (IKCacheDataVRamManager)
- (id)vramManager;
- (id)privateSharedContext;
- (void)bindEntryInVRam:(unsigned long long)index size:(int)size asACopyOf:(id)node;
- (void)flushGLOperations;
- (void)glImageInfoInContext:(id)context owner:(id)owner createIfNeeded:(BOOL)createIfNeeded;
@end

@interface NSObject (IKCacheDataImageWrapper)
- (BOOL)mappedIntoVRAM;
- (id)ramCopy;
@end

@implementation IKCacheData

- (id)init
{
    self = [super init];
    if (self != nil) {
        _db = [[IKCacheDatabase alloc] init];
    }
    return self;
}

- (void)dealloc
{
    _db = nil;
    [self prepareChildsToDie];
}

- (IKCacheDatabase *)database
{
    return _db;
}

- (IKCacheManager *)parent
{
    return _parent;
}

- (void)setParent:(IKCacheManager *)parent
{
    _parent = parent;
}

- (void)prepareChildsToDie
{
    NSMutableArray *entries = [_db entries];
    NSUInteger count = [entries count];
    for (NSUInteger i = 0; i < count; i++) {
        IKCacheDatabaseEntry *entry = [entries objectAtIndex:i];
        NSIndexSet *sizes = [entry sizes];
        NSUInteger index = [sizes firstIndex];
        while (index != NSNotFound) {
            IKCacheNode *node = [entry nodeWithSize:(int)index];
            [node setParent:nil];
            [node willDie];
            index = [sizes indexGreaterThanIndex:index];
        }
    }
}

- (IKCacheNode *)nodeForUID:(unsigned long long)uid size:(int)size createIfNeeded:(BOOL)createIfNeeded
{
    IKCacheNode *node = _lastRequestedNode;
    if (size != _lastRequestedSize || uid != _lastRequestedUID || (createIfNeeded && node == nil)) {
        IKCacheDatabaseEntry *entry = [_db entryAtIndex:uid];
        if (entry == nil) {
            NSLog(@"--ImageKit Error: %@", [NSString stringWithFormat:@"entry #%d doesn't exist", (int)uid]);
            node = nil;
        } else {
            node = [entry nodeWithSize:size];
            if (createIfNeeded && node == nil) {
                node = [[IKCacheNode alloc] initWithParent:self uid:uid database:_db size:size];
                [entry addNode:node withSize:size];
            }
            if (node != nil) {
                _lastRequestedSize = size;
                _lastRequestedUID = uid;
                _lastRequestedNode = node;
            }
        }
    }
    return node;
}

- (id)objectWithUID:(unsigned long long)uid withSize:(int)size withKey:(int)key
{
    IKCacheNode *node = [self cacheNodeWithUID:uid withSize:size];
    if (node == nil)
        return nil;
    return [node objectForCacheKey:key];
}

- (IKCacheNode *)cacheNodeWithUID:(unsigned long long)uid withSize:(int)size
{
    return [self nodeForUID:uid size:size createIfNeeded:YES];
}

- (void)removeCacheNodeWithUID:(unsigned long long)uid withSize:(int)size
{
    IKCacheDatabaseEntry *entry = [_db entryAtIndex:uid];
    if (entry == nil) {
        NSLog(@"--ImageKit Error: %@", [NSString stringWithFormat:@"remove: entry #%d doesn't exist", (int)uid]);
        return;
    }
    IKCacheNode *node = [entry nodeWithSize:size];
    if (node == nil) {
        NSLog(@"--ImageKit Error: %@", [NSString stringWithFormat:@"remove: can't find node with size %d", size]);
        return;
    }
    [entry removeNodeWithSize:size];
    if (size == _lastRequestedSize && uid == _lastRequestedUID)
        _lastRequestedNode = nil;
    [node willDie];
}

- (void)removeObjectWithUID:(unsigned long long)uid withSize:(int)size withKey:(int)key
{
    [[self nodeForUID:uid size:size createIfNeeded:NO] removeObjectForCacheKey:key];
}

- (BOOL)storeImage:(id)image withUID:(unsigned long long)uid withSize:(int)size
{
    IKCacheNode *node = [self nodeForUID:uid size:size createIfNeeded:YES];
    [node setThumbnail:image];
    if (size == _lastRequestedSize && uid == _lastRequestedUID)
        _lastRequestedNode = node;
    return YES;
}

- (unsigned long long)unshareEntriesWithUIDIfNeeded:(id)uid cacheManager:(id)cacheManager
{
    unsigned long long index = [_db indexForUID:uid];
    unsigned long long newIndex = NSNotFound;
    if (index != NSNotFound) {
        [_db retainIndex:index];
        IKCacheDatabaseEntry *entry = [_db entryAtIndex:index];
        id vramManager = [cacheManager vramManager];
        NSOpenGLContext *sharedContext = [vramManager privateSharedContext];
        NSOpenGLContext *currentContext = [NSOpenGLContext currentContext];
        [sharedContext makeCurrentContext];
        CGLContextObj context = [sharedContext CGLContextObj];
        if (context != NULL)
            CGLLockContext(context);
        newIndex = [_db unshareUID:uid];
        if (index != newIndex) {
            NSIndexSet *sizes = [entry sizes];
            NSUInteger size = [sizes firstIndex];
            BOOL didBind = NO;
            while (size != NSNotFound) {
                id thumbnail = [entry thumbnailWithSize:(int)size];
                if ([thumbnail mappedIntoVRAM]) {
                    id ramCopy = [thumbnail ramCopy];
                    id sharedRegistry = [NSClassFromString(@"IKGLSharedContextRegistry") sharedInstance];
                    [sharedRegistry glImageInfoInContext:(__bridge id)CGLGetCurrentContext() owner:ramCopy createIfNeeded:YES];
                    [self storeImage:ramCopy withUID:newIndex withSize:(int)size];
                    [[cacheManager vramManager] bindEntryInVRam:newIndex size:(int)size asACopyOf:thumbnail];
                    didBind = YES;
                } else {
                    id copy = [thumbnail copy];
                    [self storeImage:copy withUID:newIndex withSize:(int)size];
                }
                size = [sizes indexGreaterThanIndex:size];
            }
            if (didBind)
                [cacheManager flushGLOperations];
        }
        [_db releaseIndex:index];
        if (context != NULL)
            CGLUnlockContext(context);
        [currentContext makeCurrentContext];
    }
    return newIndex;
}

@end
