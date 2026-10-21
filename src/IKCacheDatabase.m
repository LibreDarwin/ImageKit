/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 */

#import "IKCacheDatabase.h"
#import "IKCacheDatabaseEntry.h"
#import "IKCacheDatabaseUIDInfo.h"
#import "IKIconDatabase.h"

@interface IKCacheDatabaseEntry (IKCacheDatabase)
+ (IKCacheDatabaseEntry *)nullNode;
- (NSMutableArray *)uids;
- (void)addUID:(id)uid;
- (void)removeUID:(id)uid;
- (long)dbRetainCount;
- (long)incrDBRetainCount;
- (long)decrDBRetainCount;
- (id)nodeWithSize:(int)size;
@end

@interface IKCacheDatabaseUIDInfo (IKCacheDatabase)
- (unsigned long long)index;
- (void)setIndex:(unsigned long long)index;
- (unsigned long long)version;
- (void)setVersion:(unsigned long long)version;
- (BOOL)isValid;
- (void)setIsValid:(BOOL)valid;
- (id)image;
- (void)setImage:(id)image;
@end

@interface IKIconDatabase (IKCacheDatabase)
- (void)removeIconCacheFromDatabaseIndex:(unsigned long long)index;
@end

@interface NSObject (IKCacheDatabaseMainLoop)
- (id)ikInMainLoopWait:(BOOL)flag;
@end

@interface IKCacheDatabase () {
    NSMutableArray *_indexedObjects;
    NSMutableDictionary *_uids;
    NSMutableIndexSet *_freeIndexes;
    IKIconDatabase *_iconCache;
}
- (void)_releaseIndex:(unsigned long long)index;
- (void)_removeEntryAtIndex:(unsigned long long)index;
- (void)_retainIndex:(unsigned long long)index;
@end

@implementation IKCacheDatabase

- (id)init
{
    self = [super init];
    if (self != nil) {
        _indexedObjects = [[NSMutableArray alloc] init];
        _uids = [[NSMutableDictionary alloc] init];
        _freeIndexes = [[NSMutableIndexSet alloc] init];
    }
    return self;
}

- (void)dealloc
{
}

- (NSMutableArray *)entries
{
    return _indexedObjects;
}

- (NSMutableIndexSet *)freeIndexes
{
    return _freeIndexes;
}

- (unsigned long long)nextFreeIndex
{
    unsigned long long index = [_freeIndexes firstIndex];
    if (index != NSNotFound) {
        [_freeIndexes removeIndex:index];
        return index;
    }
    return (unsigned long long)[_indexedObjects count];
}

- (unsigned long long)lastIndex
{
    return (unsigned long long)[_indexedObjects count];
}

- (unsigned long long)indexForUID:(id)uid
{
    IKCacheDatabaseUIDInfo *info = [_uids objectForKey:uid];
    if (info == nil)
        return NSNotFound;
    return [info index];
}

- (unsigned long long)cacheVersionForUID:(id)uid
{
    IKCacheDatabaseUIDInfo *info = [_uids objectForKey:uid];
    if (info == nil)
        return 0;
    return [info version];
}

- (BOOL)entryAtUIDIsValid:(id)uid
{
    IKCacheDatabaseUIDInfo *info = [_uids objectForKey:uid];
    return [info isValid];
}

- (id)imageWithUID:(id)uid
{
    IKCacheDatabaseUIDInfo *info = [_uids objectForKey:uid];
    return [info image];
}

- (void)setImage:(id)image withUID:(id)uid
{
    IKCacheDatabaseUIDInfo *info = [_uids objectForKey:uid];
    [info setImage:image];
}

- (void)setCacheVersion:(unsigned long long)version forUID:(id)uid
{
    IKCacheDatabaseUIDInfo *info = [_uids objectForKey:uid];
    [info setVersion:version];
}

- (void)validateEntryAtUID:(id)uid
{
    IKCacheDatabaseUIDInfo *info = [_uids objectForKey:uid];
    [info setIsValid:YES];
}

- (void)invalidateEntryAtUID:(id)uid
{
    IKCacheDatabaseUIDInfo *info = [_uids objectForKey:uid];
    [info setIsValid:NO];
}

- (void)resetInternalCacheVersionForUID:(id)uid
{
    IKCacheDatabaseUIDInfo *info = [_uids objectForKey:uid];
    [info setVersion:[info version] + 1];
}

- (IKIconDatabase *)iconCache
{
    if (_iconCache == nil)
        _iconCache = [[IKIconDatabase alloc] init];
    return _iconCache;
}

- (IKCacheDatabaseEntry *)entryAtIndex:(unsigned long long)index
{
    if ([NSThread isMainThread]) {
        if (index == NSNotFound) {
            NSLog(@"--ImageKit Error: %@", [NSString stringWithFormat:@"IKCacheDatabase::entryAtIndex - bad index"]);
            return nil;
        }
        id object = [_indexedObjects objectAtIndex:index];
        if (object == [IKCacheDatabaseEntry nullNode])
            return nil;
        return object;
    }
    return [[self ikInMainLoopWait:YES] entryAtIndex:index];
}

- (void)addReference:(id)uid atIndex:(unsigned long long)index
{
    if (index == NSNotFound)
        return;
    [[self entryAtIndex:index] addUID:uid];
}

- (void)_retainIndex:(unsigned long long)index
{
    if (index == NSNotFound)
        return;
    [[self entryAtIndex:index] incrDBRetainCount];
}

- (void)retainIndex:(unsigned long long)index
{
    [self _retainIndex:index];
}

- (void)_releaseIndex:(unsigned long long)index
{
    if (index == NSNotFound)
        return;
    IKCacheDatabaseEntry *entry = [self entryAtIndex:index];
    if ([entry decrDBRetainCount] == 0) {
        NSArray *uids = [entry uids];
        NSUInteger count = [uids count];
        for (NSUInteger i = 0; i < count; i++)
            [_uids removeObjectForKey:[uids objectAtIndex:i]];
        [_iconCache removeIconCacheFromDatabaseIndex:index];
        [self _removeEntryAtIndex:index];
    }
}

- (void)releaseIndex:(unsigned long long)index
{
    [self _releaseIndex:index];
}

- (void)_removeEntryAtIndex:(unsigned long long)index
{
    [_indexedObjects replaceObjectAtIndex:index withObject:[IKCacheDatabaseEntry nullNode]];
    [_freeIndexes addIndex:index];
}

- (unsigned long long)addUID:(id)uid
{
    unsigned long long index = [self nextFreeIndex];
    IKCacheDatabaseUIDInfo *info = [[IKCacheDatabaseUIDInfo alloc] init];
    [info setIndex:index];
    [_uids setObject:info forKey:uid];
    IKCacheDatabaseEntry *entry = [[IKCacheDatabaseEntry alloc] init];
    if (index == (unsigned long long)[_indexedObjects count])
        [_indexedObjects addObject:entry];
    else
        [_indexedObjects replaceObjectAtIndex:index withObject:entry];
    [self addReference:uid atIndex:index];
    return index;
}

- (void)associateUID:(id)uid withIndex:(unsigned long long)index
{
    IKCacheDatabaseUIDInfo *info = [_uids objectForKey:uid];
    if (info == nil) {
        NSLog(@"--ImageKit Error: %@", [NSString stringWithFormat:@"try to associate an index to an unexisting uid"]);
        return;
    }
    unsigned long long oldIndex = [info index];
    if (oldIndex != index) {
        [self addReference:uid atIndex:index];
        [self removeReference:uid atIndex:oldIndex];
        [info setIndex:index];
    }
}

- (long long)referenceCountAtIndex:(unsigned long long)index
{
    if (index == NSNotFound)
        return -1;
    id entry = [self entryAtIndex:index];
    if (entry == nil)
        return -1;
    return (long long)[[entry uids] count];
}

- (IKCacheNode *)nodeAtIndex:(unsigned long long)index withSize:(int)size
{
    return [[self entryAtIndex:index] nodeWithSize:size];
}

- (void)removeReference:(id)uid atIndex:(unsigned long long)index
{
    if (index == NSNotFound)
        return;
    if (![NSThread isMainThread]) {
        [[self ikInMainLoopWait:YES] removeReference:uid atIndex:index];
        return;
    }
    IKCacheDatabaseEntry *entry = [self entryAtIndex:index];
    [entry removeUID:uid];
    if ([[entry uids] count] == 0 && [entry dbRetainCount] == 0) {
        [_iconCache removeIconCacheFromDatabaseIndex:index];
        [self _removeEntryAtIndex:index];
    }
}

- (unsigned long long)unshareUID:(id)uid
{
    IKCacheDatabaseUIDInfo *info = [_uids objectForKey:uid];
    if (info == nil) {
        NSLog(@"--ImageKit Error: %@", [NSString stringWithFormat:@"unshareUID - unknown uid"]);
        return NSNotFound;
    }
    unsigned long long oldIndex = [info index];
    unsigned long long newIndex = [self nextFreeIndex];
    IKCacheDatabaseEntry *entry = [[IKCacheDatabaseEntry alloc] init];
    if (newIndex == (unsigned long long)[_indexedObjects count])
        [_indexedObjects addObject:entry];
    else
        [_indexedObjects replaceObjectAtIndex:newIndex withObject:entry];
    [info setIndex:newIndex];
    [self addReference:uid atIndex:newIndex];
    [self removeReference:uid atIndex:oldIndex];
    return newIndex;
}

@end
