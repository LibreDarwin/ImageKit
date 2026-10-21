/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 */

#import <AppKit/AppKit.h>
#import "ImageKitBase.h"
#import <CoreFoundation/CoreFoundation.h>

IK_CLASS_AVAILABLE(10_6)
@interface IKIconDatabase : NSObject {
    CFMutableDictionaryRef _iconToIndex;
    CFMutableDictionaryRef _indexToIcon;
}

- (void)cleanup;
- (void)associateIconRef:(IconRef)iconRef withIndex:(unsigned long long)index;
- (IconRef)iconRefForIndex:(unsigned long long)index;
- (unsigned long long)indexForIconRef:(IconRef)iconRef;
- (BOOL)indexHasIconAssociated:(unsigned long long)index;
- (void)removeIconCacheFromDatabaseIndex:(unsigned long long)index;

@end
