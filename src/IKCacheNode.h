/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 */

#import <AppKit/AppKit.h>
#import "ImageKitBase.h"

@class IKCacheData;
@class IKImageWrapper;

IK_CLASS_AVAILABLE(10_6)
@interface IKCacheNode : NSObject {
    unsigned long long _uid;
    int _size;
    IKImageWrapper *_thumbnail;
    id _data[2];
    __unsafe_unretained IKCacheData *_parent;
}

- (id)initWithParent:(id)parent uid:(unsigned long long)uid database:(id)database size:(int)size;
- (unsigned long long)uid;
- (int)size;
- (void)setSize:(int)size;
- (IKImageWrapper *)thumbnail;
- (void)setThumbnail:(IKImageWrapper *)thumbnail;
- (IKCacheData *)parent;
- (void)setParent:(IKCacheData *)parent;
- (id)objectForCacheKey:(int)cacheKey;
- (void)setObject:(id)object forCacheKey:(int)cacheKey;
- (void)removeObjectForCacheKey:(int)cacheKey;
- (void)willDie;

@end
