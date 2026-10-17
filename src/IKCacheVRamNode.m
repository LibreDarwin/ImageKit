/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 */

#import "IKCacheVRamNode.h"

@implementation IKCacheVRamNode

- (IKCacheNode *)parent
{
    return _parent;
}

- (void)setParent:(IKCacheNode *)parent
{
    _parent = parent;
}

- (unsigned int)session
{
    return _session;
}

- (void)setSession:(unsigned int)session
{
    _session = session;
}

- (unsigned int)memoryUsage
{
    return _memoryUsage;
}

- (void)setMemoryUsage:(unsigned int)memoryUsage
{
    _memoryUsage = memoryUsage;
}

- (unsigned int)packerID
{
    return _packerID;
}

- (void)setPackerID:(unsigned int)packerID
{
    _packerID = packerID;
}

- (CGRect)textureRect
{
    return _textureRect;
}

- (void)setTextureRect:(CGRect)textureRect
{
    _textureRect = textureRect;
}

- (BOOL)packed
{
    return (int)_packerID != 0;
}

- (void)willDie
{
    [self setParent:nil];
}

@end
