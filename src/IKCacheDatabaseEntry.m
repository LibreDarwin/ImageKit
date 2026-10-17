/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 */

#import "IKCacheDatabaseEntry.h"

@interface NSObject (IKCacheDatabaseEntryNode)
- (id)thumbnail;
@end

static void _fillSizes(const void *key, const void *value, void *context)
{
    (void)value;
    [(__bridge NSMutableIndexSet *)context addIndex:(NSUInteger)key];
}

static IKCacheDatabaseEntry *_nullNode;

@implementation IKCacheDatabaseEntry

+ (IKCacheDatabaseEntry *)nullNode
{
    if (_nullNode == nil)
        _nullNode = [[IKCacheDatabaseEntry alloc] init];
    return _nullNode;
}

- (void)dealloc
{
    if (self == _nullNode) {
        NSLog(@"--ImageKit Error: %@", @"deallocating a null node");
    } else {
        if (_nodes != NULL)
            CFRelease(_nodes);
    }
}

- (NSMutableArray *)uids
{
    return _uids;
}

- (void)addUID:(id)uid
{
    if (_uids == nil)
        _uids = [[NSMutableArray alloc] init];
    [_uids addObject:uid];
}

- (void)removeUID:(id)uid
{
    [_uids removeObject:uid];
}

- (BOOL)isShared
{
    return [_uids count] > 1;
}

- (long)dbRetainCount
{
    return _dbRetainCount;
}

- (long)incrDBRetainCount
{
    return ++_dbRetainCount;
}

- (long)decrDBRetainCount
{
    return --_dbRetainCount;
}

- (id)nodeWithSize:(int)size
{
    if (_nodes != NULL)
        return (__bridge id)CFDictionaryGetValue(_nodes, (const void *)(long)size);
    return nil;
}

- (void)addNode:(id)node withSize:(int)size
{
    if (_nodes == NULL)
        _nodes = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, NULL,
                                           &kCFTypeDictionaryValueCallBacks);
    CFDictionaryRemoveValue(_nodes, (const void *)(long)size);
    CFDictionaryAddValue(_nodes, (const void *)(long)size,
                         (__bridge const void *)node);
}

- (void)removeNodeWithSize:(int)size
{
    if (_nodes != NULL)
        CFDictionaryRemoveValue(_nodes, (const void *)(long)size);
}

- (id)thumbnailWithSize:(int)size
{
    return [[self nodeWithSize:size] thumbnail];
}

- (NSUInteger)thumbnailCount
{
    if (_nodes != NULL)
        return (NSUInteger)CFDictionaryGetCount(_nodes);
    return 0;
}

- (NSIndexSet *)sizes
{
    if (_nodes == NULL)
        return [NSIndexSet indexSet];
    NSMutableIndexSet *set = [[NSMutableIndexSet alloc] init];
    CFDictionaryApplyFunction(_nodes, _fillSizes, (__bridge void *)set);
    return set;
}

@end
