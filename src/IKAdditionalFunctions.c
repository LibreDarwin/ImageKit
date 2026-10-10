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
extern CGColorRef IKCreateCGColorWithColor(NSColor *color) { return NULL; }
extern NSColor *IKCreateColorWithCGColor(CGColorRef color) { return NULL; }
extern BOOL IKIsValidSizeForToolMode(CGSize size, NSString *mode) { return YES; }
extern BOOL IKSizeFitsInRect(CGSize size, CGRect rect) { return YES; }
extern BOOL IKHasReturnValueForSelector(id obj, SEL sel) { return NO; }
extern id IKUnretainedObjectForSelector(id obj, SEL sel) { return obj; }
extern BOOL IKIsValidRectForToolMode(CGRect rect, NSString *mode) { return YES; }
extern BOOL IKImageBrowserAllowsEmptySelection(id browser) { return YES; }
extern id IKImageBrowserCellForItemAtIndex(id browser, NSUInteger idx) { return nil; }
extern CGRect IKImageBrowserFrameForItemAtIndex(id browser, NSUInteger idx) { return CGRectZero; }
extern BOOL IKImageViewCanHandleImageType(NSString *type) { return YES; }
extern id IKImageViewImageWithSize(NSImage *image, NSSize size) { return image; }
extern id IKFilterBrowserViewSelectionIndexes(id view) { return [NSIndexSet indexSet]; }
extern void IKFilterBrowserViewSetSelectionIndexes(id view, id indexes) { }
extern id IKPictureTakerOutputImage(id pt) { return nil; }
extern void IKPictureTakerSetOutputImage(id pt, id image) { }
extern NSSize IKImageViewZoomToFitSize(id view) { return NSMakeSize(100,100); }
extern double IKImageViewZoomFactor(id view) { return 1.0; }
extern void IKApplyColorToContext(CGContextRef ctx, CGColorRef color) { }
extern CGAffineTransform IKTransformFromRectToRect(CGRect from, CGRect to) { return CGAffineTransformIdentity; }
extern id IKCreateCGBitmapContextWithSize(CGSize size, BOOL opaque) { return NULL; }
extern void IKRegisterDrawingLayerClass(id layerClass) { }
extern void IKUnregisterDrawingLayerClass(id layerClass) { }
extern NSBundle *IKImageKitBundle(void) { return [NSBundle bundleWithIdentifier:@"com.apple.imagekit"]; }
