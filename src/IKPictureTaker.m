/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 */

#import "IKPictureTaker.h"

NSString *const IKPictureTakerShowEffectsKey = @"IKPictureTakerShowEffectsKey";
NSString *const IKPictureTakerShowGridKey = @"IKPictureTakerShowGridKey";
NSString *const IKPictureTakerCropAreaSizeKey = @"IKPictureTakerCropAreaSizeKey";
NSString *const IKPictureTakerOutputImageMaxSizeKey = @"IKPictureTakerOutputImageMaxSizeKey";
NSString *const IKPictureTakerRemainOpenAfterValidateKey = @"IKPictureTakerRemainOpenAfterValidateKey";
NSString *const IKPictureTakerUpdateRecentPictureKey = @"IKPictureTakerUpdateRecentPictureKey";
NSString *const IKPictureTakerResolutionKey = @"IKPictureTakerResolutionKey";
NSString *const IKPictureTakerShowsProgressKey = @"IKPictureTakerShowsProgressKey";
NSString *const IKPictureTakerAllowsVideoCaptureKey = @"IKPictureTakerAllowsVideoCaptureKey";
NSString *const IKPictureTakerAllowsFileChoosingKey = @"IKPictureTakerAllowsFileChoosingKey";
NSString *const IKPictureTakerShowMetadataKey = @"IKPictureTakerShowMetadataKey";
NSString *const IKPictureTakerShowKeywordsKey = @"IKPictureTakerShowKeywordsKey";
NSString *const IKPictureTakerShowGPSKey = @"IKPictureTakerShowGPSKey";
NSString *const IKPictureTakerShowDateTimeKey = @"IKPictureTakerShowDateTimeKey";
NSString *const IKPictureTakerShowTitleKey = @"IKPictureTakerShowTitleKey";

@implementation IKPictureTaker

+ (IKPictureTaker *)pictureTaker
{
    return [[self alloc] init];
}

+ (IKPictureTaker *)pictureTakerWithOptions:(NSDictionary *)options
{
    IKPictureTaker *pt = [[self alloc] init];
    return pt;
}

- (void)beginPictureTakerWithDelegate:(id)delegate didEndSelector:(SEL)selector contextInfo:(void *)contextInfo
{
}

- (void)beginPictureTakerSheetForWindow:(NSWindow *)window withDelegate:(id)delegate didEndSelector:(SEL)selector contextInfo:(void *)contextInfo
{
}

- (void)popUpRecentsMenuForView:(NSView *)view withDelegate:(id)delegate didEndSelector:(SEL)selector contextInfo:(void *)contextInfo
{
}

- (void)runModal
{
}

@end
