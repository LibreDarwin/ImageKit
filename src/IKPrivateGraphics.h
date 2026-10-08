/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 */

#ifndef IKPrivateGraphics_h
#define IKPrivateGraphics_h

#import <CoreGraphics/CoreGraphics.h>
#import <AppKit/AppKit.h>

#ifdef __cplusplus
extern "C" {
#endif

CGContextRef IKCreateCGContextRefFromCGImageRef(CGImageRef image);
CGContextRef IKCGBitmapContextRefFromCGImageRef(CGImageRef image);
CGContextRef IKCGBitmapContextRefFromNSImage(NSImage *image);
CGContextRef IKCGBitmapContextRefFromData(NSData *data);
CGContextRef IKCGBitmapContextRefFromNSBitmapImageRep(NSBitmapImageRep *rep);

CGImageRef IKCGImageFromCGBitmapContextRef(CGContextRef ctx);
CGImageRef IKCGImageFromNSBitmapImageRep(NSBitmapImageRep *rep);
CGImageRef IKCGImageFromData(NSData *data);
CGImageRef IKCGImageFromIconRef(void *iconRef);
CGImageRef IKCGImageFromCGImageSourceRef(void *sourceRef);

NSImage *IKNSImageFromNSBitmapImageRep(NSBitmapImageRep *rep);

CGSize IKSizeOfIcon(void *iconRef);

CGImageRef IKThumbnailImage(NSImage *image, NSSize size, CGFloat scale);
CGImageRef IKThumbnailImageFromCGImage(CGImageRef image, NSSize size, CGFloat scale);
CGImageRef IKThumbnailImageFromSourceRef(void *sourceRef, NSSize size, CGFloat scale);
CGImageRef __IKThumbnailImageFromSourceRef(void *sourceRef, NSSize size, CGFloat scale);

#ifdef __cplusplus
}
#endif

#endif /* IKPrivateGraphics_h */
