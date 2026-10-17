/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 */

#import <AppKit/AppKit.h>
#import "ImageKitBase.h"
#import "IKLinkedListNode.h"

@class IKCacheNode;

IK_CLASS_AVAILABLE(10_6)
@interface IKCacheVRamNode : IKLinkedListNode {
    __unsafe_unretained IKCacheNode *_parent;
    unsigned int _session;
    unsigned int _memoryUsage;
    unsigned int _packerID;
    CGRect _textureRect;
}

- (IKCacheNode *)parent;
- (void)setParent:(IKCacheNode *)parent;
- (unsigned int)session;
- (void)setSession:(unsigned int)session;
- (unsigned int)memoryUsage;
- (void)setMemoryUsage:(unsigned int)memoryUsage;
- (unsigned int)packerID;
- (void)setPackerID:(unsigned int)packerID;
- (CGRect)textureRect;
- (void)setTextureRect:(CGRect)textureRect;
- (BOOL)packed;
- (void)willDie;

@end
