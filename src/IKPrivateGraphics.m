/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 */

#import <CoreGraphics/CoreGraphics.h>
#import <Cocoa/Cocoa.h>
#import "IKPrivateGraphics.h"

CGContextRef __CreateCGContextRefFromCGImageRef(CGImageRef image);

CGContextRef IKCGBitmapContextRefFromCGImageRef(CGImageRef image)
{
    return IKCreateCGContextRefFromCGImageRef(image);
}

CGContextRef IKCGBitmapContextRefFromNSImage(NSImage *image)
{
    if (!image)
        return NULL;
    CGImageRef cgImage = [image CGImageForProposedRect:NULL context:NULL hints:nil];
    if (!cgImage)
        return NULL;
    CGContextRef ctx = IKCreateCGContextRefFromCGImageRef(cgImage);
    return ctx;
}

CGContextRef IKCGBitmapContextRefFromData(NSData *data)
{
    if (!data || [data length] == 0)
        return NULL;
    NSBitmapImageRep *rep = [[NSBitmapImageRep alloc] initWithData:data];
    if (!rep)
        return nil;
    CGImageRef cgImage = [rep CGImage];
    CGContextRef ctx = cgImage ? IKCreateCGContextRefFromCGImageRef(cgImage) : NULL;
#if !__has_feature(objc_arc)
    [rep release];
#endif
    return ctx;
}

CGContextRef IKCGBitmapContextRefFromNSBitmapImageRep(NSBitmapImageRep *rep)
{
    if (!rep)
        return NULL;
    CGImageRef cgImage = [rep CGImage];
    if (!cgImage)
        return NULL;
    return IKCreateCGContextRefFromCGImageRef(cgImage);
}

static CGContextRef __createCGBitmapContextWithSize(CGSize size, CGFloat scale, CGImageAlphaInfo alphaInfo)
{
    size_t width = (size_t)ceil(size.width * scale);
    size_t height = (size_t)ceil(size.height * scale);
    if (width == 0 || height == 0)
        return NULL;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(NULL, width, height, 8, width * 4, colorSpace, alphaInfo);
    CGColorSpaceRelease(colorSpace);
    if (ctx)
    {
        CGContextScaleCTM(ctx, scale, scale);
    }
    return ctx;
}

CGContextRef __CreateCGContextRefFromCGImageRef(CGImageRef image)
{
    if (!image)
        return NULL;
    size_t width = CGImageGetWidth(image);
    size_t height = CGImageGetHeight(image);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(NULL, width, height, 8, width * 4, colorSpace, kCGImageAlphaPremultipliedLast);
    CGColorSpaceRelease(colorSpace);
    if (ctx)
    {
        CGContextDrawImage(ctx, CGRectMake(0, 0, width, height), image);
    }
    return ctx;
}

CGContextRef IKCreateCGContextRefFromCGImageRef(CGImageRef image)
{
    return __CreateCGContextRefFromCGImageRef(image);
}

CGImageRef IKCGImageFromCGBitmapContextRef(CGContextRef ctx)
{
    if (!ctx)
        return NULL;
    return CGBitmapContextCreateImage(ctx);
}

CGImageRef IKCGImageFromNSBitmapImageRep(NSBitmapImageRep *rep)
{
    if (!rep)
        return NULL;
    return [rep CGImage];
}

CGImageRef IKCGImageFromData(NSData *data)
{
    if (!data || [data length] == 0)
        return NULL;
    NSBitmapImageRep *rep = [[NSBitmapImageRep alloc] initWithData:data];
    if (!rep)
        return NULL;
    CGImageRef cgImage = [rep CGImage];
    CGImageRetain(cgImage);
#if !__has_feature(objc_arc)
    [rep release];
#endif
    return cgImage;
}

CGImageRef IKCGImageFromIconRef(void *iconRef)
{
    (void)iconRef;
    return NULL;
}

CGImageRef IKCGImageFromCGImageSourceRef(void *sourceRef)
{
    (void)sourceRef;
    return NULL;
}

NSImage *IKNSImageFromNSBitmapImageRep(NSBitmapImageRep *rep)
{
    if (!rep)
        return nil;
#if __has_feature(objc_arc)
    return [[NSImage alloc] initWithCGImage:[rep CGImage] size:NSZeroSize];
#else
    return [[[NSImage alloc] initWithCGImage:[rep CGImage] size:NSZeroSize] autorelease];
#endif
}

CGSize IKSizeOfIcon(void *iconRef)
{
    (void)iconRef;
    return CGSizeMake(0, 0);
}

static CGImageRef __IKThumbnailImageFromSourceRefInternal(void *sourceRef, CGSize size, CGFloat scale, BOOL asIcon)
{
    (void)sourceRef;
    (void)size;
    (void)scale;
    (void)asIcon;
    return NULL;
}

CGImageRef IKThumbnailImage(NSImage *image, NSSize size, CGFloat scale)
{
    if (!image)
        return NULL;
    CGImageRef cgImage = [image CGImageForProposedRect:NULL context:NULL hints:nil];
    return IKThumbnailImageFromCGImage(cgImage, size, scale);
}

CGImageRef IKThumbnailImageFromCGImage(CGImageRef image, NSSize size, CGFloat scale)
{
    if (!image)
        return NULL;
    CGContextRef ctx = __createCGBitmapContextWithSize(size, scale, kCGImageAlphaPremultipliedLast);
    if (!ctx)
        return NULL;
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    CGContextDrawImage(ctx, rect, image);
    CGImageRef thumb = CGBitmapContextCreateImage(ctx);
    CGContextRelease(ctx);
    return thumb;
}

CGImageRef IKThumbnailImageFromSourceRef(void *sourceRef, NSSize size, CGFloat scale)
{
    return __IKThumbnailImageFromSourceRefInternal(sourceRef, size, scale, NO);
}

CGImageRef __IKThumbnailImageFromSourceRef(void *sourceRef, NSSize size, CGFloat scale)
{
    return __IKThumbnailImageFromSourceRefInternal(sourceRef, size, scale, NO);
}
