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
- (void)setValue:(id)value forKey:(NSString *)key
{
}

- (id)valueForKey:(NSString *)key
{
    return nil;
}

- (void)setInputImage:(NSImage *)image
{
}

- (NSImage *)inputImage
{
    return nil;
}

- (void)setOutputImage:(NSImage *)image
{
}

- (NSImage *)outputImage
{
    return nil;
}

/* --- generated selector-parity stubs --- */
+ (id)defaultStyleMask
{
    return nil;
}

+ (id)newDefaultParameters
{
    return nil;
}

- (id)_defaultContentRect
{
    return nil;
}

- (id)_dismissPopoverIfVisible
{
    return nil;
}

- (id)beginPictureTakerPopoverForView:(id)arg1 withDelegate:(id)arg2 relativeRect:(id)arg3 source:(id)arg4 didEndSelector:(id)arg5 contextInfo:(id)arg6
{
    return nil;
}

- (id)closeForCancelButton
{
    return nil;
}

- (id)controller:(id)arg1 terminatedWithError:(id)arg2
{
    return nil;
}

- (id)didEndShouldCloseSheet:(id)arg1 returnCode:(id)arg2 contextInfo:(id)arg3
{
    return nil;
}

- (id)imageCroppedRect
{
    return nil;
}

- (id)imageHasChanged
{
    return nil;
}

- (id)initWithTexture:(id)arg1
{
    return nil;
}

- (id)initWithTexture:(id)arg1 atPoint:(id)arg2
{
    return nil;
}

- (id)interfaceForController:(id)arg1
{
    return nil;
}

- (id)mirroring
{
    return nil;
}

- (id)notifyDelegateWithResultCode:(id)arg1
{
    return nil;
}

- (id)pictureTakerCommonInit:(id)arg1
{
    return nil;
}

- (id)pictureTakerSessionDidEndWithCode:(id)arg1
{
    return nil;
}

- (id)recentPictureID
{
    return nil;
}

- (id)releasePopover
{
    return nil;
}

- (id)screenCropRect
{
    return nil;
}

- (id)serviceDidLayoutWithSize:(id)arg1
{
    return nil;
}

- (id)serviceInterfaceForController:(id)arg1
{
    return nil;
}

- (id)serviceRequestsCloseForCancelButton
{
    return nil;
}

- (id)serviceRequestsCloseForDoneButtonWithOutputImage:(id)arg1 imageHasChanged:(id)arg2 recentPictureID:(id)arg3 cropRect:(id)arg4 screenCropRect:(id)arg5
{
    return nil;
}

- (void)setImageCroppedRect:(id)arg1
{

}

- (void)setMirroring:(id)arg1
{

}

- (id)sheetDidEnd:(id)arg1 returnCode:(id)arg2 contextInfo:(id)arg3
{
    return nil;
}

- (id)tearDownRemoteViewController
{
    return nil;
}

- (id)withRemoteViewController:(id)arg1
{
    return nil;
}
@end

