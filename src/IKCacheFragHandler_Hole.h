/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 */

#import <AppKit/AppKit.h>
#import "ImageKitBase.h"

IK_CLASS_AVAILABLE(10_6)
@interface IKCacheFragHandler_Hole : NSObject {
    unsigned long long _start;
    unsigned long long _len;
}

+ (id)holeWithStart:(unsigned long long)start len:(unsigned long long)len;
- (id)initWithStart:(unsigned long long)start len:(unsigned long long)len;
- (void)setStart:(unsigned long long)start len:(unsigned long long)len;
- (unsigned long long)start;
- (unsigned long long)len;
- (NSRange)range;
- (void)setRange:(NSRange)range;

@end
