/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 */

#import "IKCacheFragHandler_Hole.h"

@implementation IKCacheFragHandler_Hole

+ (id)holeWithStart:(unsigned long long)start len:(unsigned long long)len
{
    return [[self alloc] initWithStart:start len:len];
}

- (id)initWithStart:(unsigned long long)start len:(unsigned long long)len
{
    self = [super init];
    _start = start;
    _len = len;
    return self;
}

- (void)setStart:(unsigned long long)start len:(unsigned long long)len
{
    _start = start;
    _len = len;
}

- (unsigned long long)start
{
    return _start;
}

- (unsigned long long)len
{
    return _len;
}

- (NSRange)range
{
    return NSMakeRange(_start, _len);
}

- (void)setRange:(NSRange)range
{
    _start = range.location;
    _len = range.length;
}

@end
