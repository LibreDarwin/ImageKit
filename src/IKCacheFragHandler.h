/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 */

#import <AppKit/AppKit.h>
#import "ImageKitBase.h"

@class IKCacheFragHandler_Hole;

IK_CLASS_AVAILABLE(10_6)
@interface IKCacheFragHandler : NSObject {
    unsigned long long _totalLen;
    unsigned long long _holesLen;
    __strong id *_sizeRanks;
    NSMutableArray *_orderedByStart;
    NSString *_path;
    BOOL _isDirty;
}

- (id)initWithFilePath:(NSString *)path;
- (id)initWithDictionary:(NSDictionary *)dict;
- (void)save;
- (NSDictionary *)dataToSave;
- (BOOL)isDirty;
- (unsigned long long)totalLen;
- (float)frag;
- (BOOL)canFindHoleForLen:(unsigned long long)len;
- (unsigned long long)allocateSpaceForLen:(unsigned long long)len added:(BOOL *)added;
- (void)releaseSpaceAtPos:(unsigned long long)pos withLen:(unsigned long long)len;
- (BOOL)getLastHoleStart:(unsigned long long *)start len:(unsigned long long *)len;
- (void)truncateFromPosition:(unsigned long long)pos;
- (BOOL)checkConsistency;
- (BOOL)checkHolesLenConsistency;
- (void)assertSpaceIsRetainedAtPos:(unsigned long long)pos withLen:(unsigned long long)len;
- (NSMutableArray *)orderedByStart;

@end
