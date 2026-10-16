/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 */

#import "IKImageEditPanel.h"

@implementation IKImageEditPanel

+ (IKImageEditPanel *)sharedImageEditPanel
{
    static IKImageEditPanel *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}

- (void)runModal
{
}

- (void)runModalWithDelegate:(id)delegate didEndSelector:(SEL)selector contextInfo:(void *)contextInfo
{
}

- (id)dataSource
{
    return nil;
}

- (void)setDataSource:(id)dataSource
{
}

- (void)setDelegate:(id)delegate
{
}

- (id)delegate
{
    return nil;
}

/* --- generated selector-parity stubs --- */
+ (id)IKEditPanelLocalizedString:(id)arg1
{
    return nil;
}

+ (id)IKImageIOLocalizedString:(id)arg1
{
    return nil;
}

+ (id)hasSharedImageEditPanel
{
    return nil;
}

+ (id)locateLongitude:(id)arg1 latitude:(id)arg2
{
    return nil;
}

+ (id)locateLongitude:(id)arg1 latitude:(id)arg2 query:(id)arg3
{
    return nil;
}

+ (id)processMetaData:(id)arg1
{
    return nil;
}

- (id)adjustDisplayModes:(id)arg1
{
    return nil;
}

- (id)dsHandler
{
    return nil;
}

- (id)filterArray
{
    return nil;
}

- (id)hasAdjustMode
{
    return nil;
}

- (id)hasDetailsMode
{
    return nil;
}

- (id)hasEffectsMode
{
    return nil;
}

- (id)makeBig
{
    return nil;
}

- (id)makeSmall
{
    return nil;
}

- (void)setHasAdjustMode:(id)arg1
{

}

- (void)setHasDetailsMode:(id)arg1
{

}

- (void)setHasEffectsMode:(id)arg1
{

}

- (id)setup
{
    return nil;
}

- (id)showPanel:(id)arg1
{
    return nil;
}

- (id)tabHeight
{
    return nil;
}

- (id)tabSelectionChanged:(id)arg1
{
    return nil;
}

- (id)windowbarHeight
{
    return nil;
}
@end
