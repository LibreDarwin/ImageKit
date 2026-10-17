/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 */

#import <AppKit/AppKit.h>
#import "ImageKitBase.h"
#import "IKCacheFragHandler.h"

IK_CLASS_AVAILABLE(10_6)
@interface IKSegmentedRawDataBuffer : NSObject {
    unsigned int _totalSpace;
    unsigned int _usedSpace;
    int _estimatedItemCount;
    NSMutableDictionary *_fragments;
    void *_segmentedBuffer;
    IKCacheFragHandler *_fragHandler;
    unsigned int _realBufferLength;
    unsigned int _totalSpacePlusOverhead;
}

@end
