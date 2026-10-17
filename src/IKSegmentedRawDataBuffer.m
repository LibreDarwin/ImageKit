/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 */

#import "IKSegmentedRawDataBuffer.h"

@interface IKCacheFragHandler (IKSegmentedRawDataBufferPrivate)
- (void)clear;
@end

@implementation IKSegmentedRawDataBuffer

- (id)initWithMemorySize:(unsigned int)size
{
    self = [super init];
    if (self != nil) {
        _totalSpace = size;
        _totalSpacePlusOverhead = (unsigned int)((float)size + 0.1f * (float)size);
        _fragHandler = [[IKCacheFragHandler alloc] init];
        _fragments = [[NSMutableDictionary alloc] init];
        _segmentedBuffer = NULL;
        _estimatedItemCount = 0;
    }
    return self;
}

- (void)dealloc
{
    [self freeCache];
    if (_segmentedBuffer != NULL)
        free(_segmentedBuffer);
}

- (void)finalize
{
    [self freeCache];
    if (_segmentedBuffer != NULL)
        free(_segmentedBuffer);
    _segmentedBuffer = NULL;
}

- (void)incrSize:(unsigned int)size
{
    _usedSpace += size;
    _estimatedItemCount += 1;
}

- (void)decrSize:(unsigned int)size
{
    _usedSpace -= size;
    _estimatedItemCount -= 1;
}

- (void)checkBufferSize
{
    unsigned int length = _totalSpacePlusOverhead;
    if (_realBufferLength != length) {
        if (_segmentedBuffer != NULL) {
            free(_segmentedBuffer);
            length = _totalSpacePlusOverhead;
        }
        _segmentedBuffer = NULL;
        _realBufferLength = length;
        if (length != 0)
            _segmentedBuffer = malloc(length);
        BOOL added = NO;
        [_fragHandler clear];
        [_fragHandler allocateSpaceForLen:_totalSpacePlusOverhead added:&added];
        [_fragHandler allocateSpaceForLen:1 added:&added];
        [_fragHandler releaseSpaceAtPos:0 withLen:_totalSpacePlusOverhead];
    }
}

- (void *)newSegmentOfSize:(unsigned int)size
{
    BOOL added = NO;
    [self checkBufferSize];
    unsigned long long pos = [_fragHandler allocateSpaceForLen:size added:&added];
    void *segment;
    if (added) {
        segment = malloc(size);
        [_fragments setObject:[NSNumber valueWithPointer:segment]
                       forKey:[NSString stringWithFormat:@"%p", segment]];
    } else {
        segment = (char *)_segmentedBuffer + pos;
    }
    [self incrSize:size];
    return segment;
}

- (void)releaseSegment:(void *)segment ofSize:(unsigned int)size
{
    void *base = _segmentedBuffer;
    if (segment < base || (char *)base + _realBufferLength <= (char *)segment) {
        free(segment);
        [_fragments removeObjectForKey:[NSString stringWithFormat:@"%p", segment]];
    } else {
        [_fragHandler releaseSpaceAtPos:((char *)segment - (char *)base) withLen:size];
    }
    [self decrSize:size];
}

- (unsigned int)totalSpace
{
    if (_segmentedBuffer != NULL)
        return _totalSpace;
    return 0;
}

- (unsigned int)usedSpace
{
    return _usedSpace;
}

- (int)freeSpace
{
    return (int)_totalSpace - (int)_usedSpace;
}

- (void)setTotalSpace:(unsigned int)size
{
    _totalSpace = size;
    _totalSpacePlusOverhead = (unsigned int)((float)size + 0.1f * (float)size);
}

- (int)estimatedItemCount
{
    return _estimatedItemCount;
}

- (int)estimatedFragmentCount
{
    return (int)[_fragments count];
}

- (IKCacheFragHandler *)fragHandler
{
    return _fragHandler;
}

- (void)freeCache
{
    if (_segmentedBuffer != NULL)
        free(_segmentedBuffer);
    NSArray *fragments = [_fragments allValues];
    NSUInteger count = [fragments count];
    for (NSUInteger i = 0; i < count; i++)
        free([[fragments objectAtIndex:i] pointerValue]);
    [_fragments removeAllObjects];
    _segmentedBuffer = NULL;
    _realBufferLength = 0;
}

- (IKCacheFragHandler *)cacheFragHandler
{
    return _fragHandler;
}

- (void *)startAddress
{
    return _segmentedBuffer;
}

- (unsigned int)segmentedBufferLength
{
    return _realBufferLength;
}

@end
