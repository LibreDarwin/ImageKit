/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 */

#import "IKCacheRamNode.h"
#import "IKImageWrapper.h"

extern CGSize IKThumbSizeFromSize(int size);

@interface IKImageWrapper (IKCacheRamNodeImage)
+ (id)imageWithNSBitmapImageRep:(NSBitmapImageRep *)rep;
+ (id)imageWithData:(NSData *)data;
- (id)thumbnailWithSize:(double)size antialiased:(BOOL)antialiased quality:(int)quality;
@end

@implementation IKCacheRamNode

- (id)init
{
    self = [super init];
    if (self != nil)
        _rawDataFormat = 0;
    return self;
}

- (void)dealloc
{
}

- (IKCacheNode *)parent
{
    return _parent;
}

- (void)setParent:(IKCacheNode *)parent
{
    _parent = parent;
}

- (unsigned int)cacheUsedByBitmapRep
{
    return _cacheUsedByBitmapRep;
}

- (void)setCacheUsedByBitmapRep:(unsigned int)value
{
    _cacheUsedByBitmapRep = value;
}

- (unsigned int)cacheUsedByJpegData
{
    return _cacheUsedByJpegData;
}

- (void)setCacheUsedByJpegData:(unsigned int)value
{
    _cacheUsedByJpegData = value;
}

- (unsigned int)session
{
    return _session;
}

- (void)setSession:(unsigned int)session
{
    _session = session;
}

- (int)rawDataFormat
{
    return _rawDataFormat;
}

- (void)setRawDataFormat:(int)format
{
    _rawDataFormat = format;
}

- (BOOL)isInPriorityList
{
    return _isInPriorityList;
}

- (void)setIsInPriorityList:(BOOL)flag
{
    _isInPriorityList = flag;
}

- (unsigned int)totalCacheUsed
{
    return _cacheUsedByJpegData + _cacheUsedByBitmapRep;
}

- (NSBitmapImageRep *)bitmap
{
    return _bitmapRep;
}

- (void)setBitmap:(NSBitmapImageRep *)bitmap
{
    if (_bitmapRep != bitmap)
        _bitmapRep = bitmap;
}

- (NSData *)data
{
    return _data;
}

- (void)setData:(NSData *)data
{
    if (_data != data)
        _data = data;
}

- (void)willDie
{
    [self setParent:nil];
}

- (int)proxyDataFormat
{
    if (_bitmapRep != nil)
        return 2;
    return _data != nil;
}

- (id)proxyData
{
    if (_bitmapRep != nil)
        return _bitmapRep;
    return _data;
}

- (id)proxyImage
{
    if (_bitmapRep != nil)
        return [IKImageWrapper imageWithNSBitmapImageRep:_bitmapRep];
    if (_data != nil)
        return [IKImageWrapper imageWithData:_data];
    return nil;
}

- (id)proxyReferenceInstance
{
    return self;
}

- (CGSize)proxySize
{
    return [[self proxyImage] size];
}

- (BOOL)isVectorial
{
    return NO;
}

- (BOOL)supportConcurrentLoading
{
    NSLog(@"--ImageKit Error: %@", [NSString stringWithFormat:@"supportConcurrentLoading should never be invoked on ram nodes"]);
    return NO;
}

- (id)thumbnailWithSize:(double)size antialiased:(BOOL)antialiased quality:(int)quality
{
    id image = [self proxyImage];
    (void)[image size];
    CGSize thumbSize = IKThumbSizeFromSize((int)size);
    return [image thumbnailWithSize:thumbSize.width antialiased:antialiased quality:quality];
}

@end
