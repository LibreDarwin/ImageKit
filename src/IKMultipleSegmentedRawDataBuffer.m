/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 */

#import "IKMultipleSegmentedRawDataBuffer.h"
#import "IKSegmentedRawDataBuffer.h"

@interface IKSegmentedRawDataBuffer (IKMultipleSegmentedRawDataBufferPrivate)
- (id)initWithMemorySize:(unsigned int)size;
- (void)checkBufferSize;
- (void *)newSegmentOfSize:(unsigned int)size;
- (void)releaseSegment:(void *)segment ofSize:(unsigned int)size;
- (unsigned int)totalSpace;
- (unsigned int)usedSpace;
- (int)freeSpace;
- (void)setTotalSpace:(unsigned int)size;
- (int)estimatedItemCount;
- (void)freeCache;
- (IKCacheFragHandler *)cacheFragHandler;
- (void *)startAddress;
- (unsigned int)segmentedBufferLength;
@end

@implementation IKMultipleSegmentedRawDataBuffer

- (id)initWithMemorySize:(unsigned int)size
{
    self = [super init];
    if (self != nil) {
        _buffers = [[NSMutableArray alloc] init];
        _blockSize = size;
        [_buffers addObject:[[IKSegmentedRawDataBuffer alloc] initWithMemorySize:_blockSize]];
    }
    return self;
}

- (void)dealloc
{
    [self freeCache];
}

- (void *)newSegmentOfSize:(unsigned int)size
{
    NSUInteger count = [_buffers count];
    IKSegmentedRawDataBuffer *buffer = nil;
    for (NSUInteger i = 0; i < count; i++) {
        IKSegmentedRawDataBuffer *b = [_buffers objectAtIndex:i];
        if ((unsigned int)size <= (unsigned int)[b freeSpace]) {
            [b checkBufferSize];
            if ([[b cacheFragHandler] canFindHoleForLen:(unsigned int)size]) {
                buffer = b;
                break;
            }
        }
    }
    if (buffer == nil) {
        buffer = [[IKSegmentedRawDataBuffer alloc] initWithMemorySize:_blockSize];
        [_buffers addObject:buffer];
    }
    return [buffer newSegmentOfSize:size];
}

- (BOOL)containsAddress:(void *)address
{
    NSUInteger count = [_buffers count];
    for (NSUInteger i = 0; i < count; i++) {
        IKSegmentedRawDataBuffer *b = [_buffers objectAtIndex:i];
        char *start = (char *)[b startAddress];
        if (start <= (char *)address && (char *)address < start + [b segmentedBufferLength])
            return YES;
    }
    return NO;
}

- (void)releaseSegment:(void *)segment ofSize:(unsigned int)size
{
    NSUInteger count = [_buffers count];
    for (NSUInteger i = 0; i < count; i++) {
        IKSegmentedRawDataBuffer *b = [_buffers objectAtIndex:i];
        char *start = (char *)[b startAddress];
        if (start <= (char *)segment && (char *)segment < start + [b segmentedBufferLength]) {
            [b releaseSegment:segment ofSize:size];
            if ([b usedSpace] != 0)
                return;
            [_buffers removeObject:b];
            return;
        }
    }
    NSLog(@"--ImageKit Error: %@", [NSString stringWithFormat:@"error in : IKMultipleSegmentedRawDataBuffer::releaseSegment can't find owner of %p", segment]);
}

- (unsigned int)totalSpace
{
    unsigned int total = 0;
    NSUInteger count = [_buffers count];
    for (NSUInteger i = 0; i < count; i++)
        total += (unsigned int)[[_buffers objectAtIndex:i] totalSpace];
    return total;
}

- (unsigned int)usedSpace
{
    unsigned int used = 0;
    NSUInteger count = [_buffers count];
    for (NSUInteger i = 0; i < count; i++)
        used += (unsigned int)[[_buffers objectAtIndex:i] usedSpace];
    return used;
}

- (int)freeSpace
{
    int free = 0;
    NSUInteger count = [_buffers count];
    for (NSUInteger i = 0; i < count; i++)
        free += [[_buffers objectAtIndex:i] freeSpace];
    return free;
}

- (void)setTotalSpace:(unsigned int)size
{
    [self freeCache];
    _blockSize = size;
    [[_buffers objectAtIndex:0] setTotalSpace:size];
}

- (int)estimatedItemCount
{
    int count = 0;
    NSUInteger bufferCount = [_buffers count];
    for (NSUInteger i = 0; i < bufferCount; i++)
        count += [[_buffers objectAtIndex:i] estimatedItemCount];
    return count;
}

- (int)estimatedFragmentCount
{
    return (int)[_buffers count];
}

- (void)freeCache
{
    if ([_buffers count] >= 2) {
        while ([_buffers count] > 1)
            [_buffers removeLastObject];
    } else if ([_buffers count] == 0) {
        return;
    }
    [[_buffers objectAtIndex:0] freeCache];
}

- (NSMutableArray *)segmentedBuffers
{
    return _buffers;
}

- (id)segmentedBufferAtIndex:(int)index
{
    if ([_buffers count] <= (unsigned long)index)
        return nil;
    return [_buffers objectAtIndex:index];
}

@end
