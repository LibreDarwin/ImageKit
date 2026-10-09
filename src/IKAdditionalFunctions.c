/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 */

#include <CoreGraphics/CoreGraphics.h>
#include <Foundation/Foundation.h>

extern void IK1600Driver(void) { }
extern CFAbsoluteTime IKAccelerateTime(CFAbsoluteTime t) { return t; }
extern CGColorRef IKAllocCGColor(void) { return NULL; }
extern BOOL IKAppPreferencesBoolValueForKey(NSString *key) { return NO; }
extern CGFloat IKAppPreferencesFloatValueForKey(NSString *key) { return 0.0; }
extern CGFloat IKBackingScaleFactor(void) { return 1.0; }
extern NSBitmapImageRep *IKBestRepresentationFromNSImageForPhysicalSize(NSImage *image, NSSize size) { return nil; }
extern CGFloat IKBezelGroupType(void) { return 0.0; }
