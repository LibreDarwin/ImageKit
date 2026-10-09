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
