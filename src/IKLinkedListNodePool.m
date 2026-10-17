/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 */

#import "IKLinkedListNodePool.h"
#import "IKLinkedListNode.h"

@interface IKLinkedList (IKLinkedListNodePoolPrivate)
- (id)first;
- (void)remove:(id)arg1;
- (void)addFirst:(id)arg1;
@end

@implementation IKLinkedListNodePool

- (id)init {
    self = [super init];
    if (self) {
        _freeNodes = [[IKLinkedList alloc] init];
        _nodePool = [[NSMutableArray alloc] init];
    }
    return self;
}

- (id)node {
    id node = [_freeNodes first];
    if (node == nil) {
        node = [[IKLinkedListNode alloc] init];
        [_nodePool addObject:node];
    } else {
        [_freeNodes remove:node];
    }
    return node;
}

- (void)releaseNode:(id)arg1 {
    if (arg1 != nil) {
        [_freeNodes addFirst:arg1];
    }
}

- (void)free {
    _freeNodes = [[IKLinkedList alloc] init];
    [_nodePool removeAllObjects];
}

- (void)dealloc {
}

@end
