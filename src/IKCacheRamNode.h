/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 */

#import <AppKit/AppKit.h>
#import "ImageKitBase.h"
#import "IKLinkedListLink.h"

@class IKCacheNode;

IK_CLASS_AVAILABLE(10_6)
@interface IKCacheRamNode : IKLinkedListLink {
    __unsafe_unretained IKCacheNode *_parent;
    unsigned int _cacheUsedByBitmapRep;
    unsigned int _cacheUsedByJpegData;
    unsigned int _session;
    int _rawDataFormat;
    BOOL _isInPriorityList;
    NSBitmapImageRep *_bitmapRep;
    NSData *_data;
}

- (id)init;
- (IKCacheNode *)parent;
- (void)setParent:(IKCacheNode *)parent;
- (unsigned int)cacheUsedByBitmapRep;
- (void)setCacheUsedByBitmapRep:(unsigned int)value;
- (unsigned int)cacheUsedByJpegData;
- (void)setCacheUsedByJpegData:(unsigned int)value;
- (unsigned int)session;
- (void)setSession:(unsigned int)session;
- (int)rawDataFormat;
- (void)setRawDataFormat:(int)format;
- (BOOL)isInPriorityList;
- (void)setIsInPriorityList:(BOOL)flag;
- (unsigned int)totalCacheUsed;
- (NSBitmapImageRep *)bitmap;
- (void)setBitmap:(NSBitmapImageRep *)bitmap;
- (NSData *)data;
- (void)setData:(NSData *)data;
- (void)willDie;
- (int)proxyDataFormat;
- (id)proxyData;
- (id)proxyImage;
- (id)proxyReferenceInstance;
- (CGSize)proxySize;
- (BOOL)isVectorial;
- (BOOL)supportConcurrentLoading;
- (id)thumbnailWithSize:(double)size antialiased:(BOOL)antialiased quality:(int)quality;

@end
