/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 */

#import <AppKit/AppKit.h>
#import "ImageKitBase.h"
#import <CoreFoundation/CoreFoundation.h>

IK_CLASS_AVAILABLE(10_6)
@interface IKCacheDatabaseEntry : NSObject {
    NSMutableArray *_uids;
    CFMutableDictionaryRef _nodes;
    long _dbRetainCount;
}

@end
