/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 */

#import "IKCacheNode.h"

@interface NSObject (IKCacheNodeCacheDatabase)
- (id)database;
- (void)retainIndex:(unsigned long long)index;
- (void)releaseIndex:(unsigned long long)index;
- (void)willDie;
@end

@implementation IKCacheNode

- (id)initWithParent:(id)parent uid:(unsigned long long)uid database:(id)database size:(int)size
{
    self = [super init];
    if (self != nil) {
        _uid = uid;
        _parent = parent;
        _size = size;
        [database retainIndex:uid];
    }
    return self;
}

- (void)dealloc
{
}

- (unsigned long long)uid
{
    return _uid;
}

- (int)size
{
    return _size;
}

- (void)setSize:(int)size
{
    _size = size;
}

- (IKImageWrapper *)thumbnail
{
    return _thumbnail;
}

- (void)setThumbnail:(IKImageWrapper *)thumbnail
{
    if (_thumbnail != thumbnail)
        _thumbnail = thumbnail;
}

- (IKCacheData *)parent
{
    return _parent;
}

- (void)setParent:(IKCacheData *)parent
{
    _parent = parent;
}

- (id)objectForCacheKey:(int)cacheKey
{
    if (cacheKey < 2)
        return _data[cacheKey];
    return nil;
}

- (void)setObject:(id)object forCacheKey:(int)cacheKey
{
    if (cacheKey < 2 && object != _data[cacheKey])
        _data[cacheKey] = object;
}

- (void)removeObjectForCacheKey:(int)cacheKey
{
    if (cacheKey < 2) {
        [_data[cacheKey] willDie];
        _data[cacheKey] = nil;
    }
}

- (void)willDie
{
    _thumbnail = nil;
    [_data[0] willDie];
    [_data[1] willDie];
    if (_parent != nil) {
        [[(id)_parent database] releaseIndex:_uid];
        _uid = 0x7fffffffffffffffULL;
        [self setParent:nil];
    }
}

@end
