/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 */

#include <CoreGraphics/CoreGraphics.h>

extern void IK1600Driver(void) { }
extern CFAbsoluteTime IKAccelerateTime(CFAbsoluteTime t) { return t; }
extern CGColorRef IKAllocCGColor(void) { return NULL; }
extern CGFloat IKBackingScaleFactor(void) { return 1.0; }
extern CGFloat IKBezelGroupType(void) { return 0.0; }
extern BOOL IKCGImageHasAlphaChannel(CGImageRef image) { return YES; }
extern CGRect IKCGRectMakeFromString(NSString *s) { return CGRectZero; }
extern CGSize IKCGSizeMakeFromString(NSString *s) { return CGSizeZero; }
extern CGPoint IKCGPointMakeFromString(NSString *s) { return CGPointZero; }
extern NSString *IKStringFromCGRect(CGRect r) { return nil; }
extern NSString *IKStringFromCGSize(CGSize s) { return nil; }
extern NSString *IKStringFromCGPoint(CGPoint p) { return nil; }
extern CGImageRef IKCGImageFromBitmapContext(void *ctx) { return NULL; }
extern CGContextRef IKCGContextFromBitmapContext(void *ctx) { return NULL; }
extern CFTypeRef IKCreateIOImageFromCGImage(CGImageRef image) { return NULL; }
