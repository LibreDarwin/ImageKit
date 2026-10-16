/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 */

#import "IKGLTextCacheFragHandler.h"

@interface IKCacheFragHandler (IKGLTextCacheFragHandlerPrivate)
- (void)clear;
@end

@implementation IKGLTextCacheFragHandler

- (id)initWithSize:(CGSize)size {
    self = [super init];
    if (self) {
        _fragHandler = [[IKCacheFragHandler alloc] init];
        _maxLineHeight = 20;
        _currentSize = size;
        [self _resetFragHandlerWithSize:size];
    }
    return self;
}

- (void)_resetFragHandlerWithSize:(CGSize)size {
    BOOL added = NO;
    [_fragHandler clear];
    int count = (int)(size.height / (double)_maxLineHeight);
    unsigned int *positions = malloc(count * sizeof(unsigned int));
    if (count > 0) {
        int i;
        for (i = 0; i < count; i++) {
            positions[i] = (unsigned int)[_fragHandler allocateSpaceForLen:(unsigned long long)(int)(size.width - 1.0) added:&added];
            [_fragHandler allocateSpaceForLen:1 added:&added];
        }
        for (i = 0; i < count; i++) {
            [_fragHandler releaseSpaceAtPos:positions[i] withLen:(unsigned long long)(int)(size.width - 1.0)];
        }
    }
    free(positions);
}

- (void)resetCacheWithSize:(CGSize)size {
    [self _resetFragHandlerWithSize:size];
    _currentSize = size;
    _usedSpace = NSZeroRect;
}

- (void)reset {
    [self resetCacheWithSize:_currentSize];
}

- (void)setMaxLineHeight:(int)height {
    if (_maxLineHeight == height) {
        return;
    }
    _maxLineHeight = height;
    [self reset];
}

- (int)maxLineHeight {
    return _maxLineHeight;
}

- (IKCacheFragHandler *)fragHandler {
    return _fragHandler;
}

- (BOOL)canAllocateSize:(CGSize)size {
    return [_fragHandler canFindHoleForLen:(unsigned long long)size.width];
}

- (CGRect)allocateSize:(CGSize)size {
    BOOL added = NO;
    CGRect rect;
    if (_currentSize.width - 1.0 <= size.width) {
        rect = NSZeroRect;
        NSLog(@"--ImageKit Error: %@", [NSString stringWithFormat:@"cannot allocate fragment of this size"]);
    } else {
        unsigned long long pos = [_fragHandler allocateSpaceForLen:(unsigned long long)size.width added:&added];
        rect = [self _convertPos:(unsigned int)pos AndLen:(unsigned int)size.width];
        _usedSpace = NSUnionRect(rect, _usedSpace);
        if (added) {
            NSLog(@"--ImageKit Error: %@", [NSString stringWithFormat:@"allocated size should not have added new fragmentation"]);
        }
    }
    return rect;
}

- (CGRect)_convertPos:(unsigned int)pos AndLen:(unsigned int)len {
    unsigned int width = (unsigned int)_currentSize.width;
    int row = (int)((double)pos / (double)width);
    unsigned int x = pos - (pos / width) * width;
    return CGRectMake((double)x, (double)(row * _maxLineHeight), (double)len, (double)_maxLineHeight);
}

- (void)_convertRect:(CGRect)rect toPos:(unsigned int *)pos andLen:(unsigned int *)len {
    *pos = (unsigned int)(rect.origin.x + (double)(unsigned int)_currentSize.width * (rect.origin.y / (double)_maxLineHeight));
    *len = (unsigned int)rect.size.width;
}

- (BOOL)freeRect:(CGRect)rect {
    unsigned int len = 0;
    unsigned int pos = 0;
    [self _convertRect:rect toPos:&pos andLen:&len];
    [_fragHandler releaseSpaceAtPos:pos withLen:len];
    return NO;
}

- (CGRect)boundingRectOfUsedSpace {
    return _usedSpace;
}

- (void)dealloc {
}

@end
