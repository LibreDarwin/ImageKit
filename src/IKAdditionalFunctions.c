/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 */

#include <CoreGraphics/CoreGraphics.h>
#import <AppKit/AppKit.h>
#import <ImageIO/ImageIO.h>

extern void IK1600Driver(void) { }
extern CFAbsoluteTime IKAccelerateTime(CFAbsoluteTime t) { return t; }
extern CGColorRef IKAllocCGColor(void) { return NULL; }
extern CGFloat IKBackingScaleFactor(void) { return 1.0; }
extern CGFloat IKBezelGroupType(void) { return 0.0; }
extern BOOL IKCGImageHasAlphaChannel(CGImageRef image) {
    (void)image;
 return YES; }
extern CGRect IKCGRectMakeFromString(NSString *s) {
    (void)s;
 return CGRectZero; }
extern CGSize IKCGSizeMakeFromString(NSString *s) {
    (void)s;
 return CGSizeZero; }
extern CGPoint IKCGPointMakeFromString(NSString *s) {
    (void)s;
 return CGPointZero; }
extern NSString *IKStringFromCGRect(CGRect r) {
    (void)r;
 return nil; }
extern NSString *IKStringFromCGSize(CGSize s) {
    (void)s;
 return nil; }
extern NSString *IKStringFromCGPoint(CGPoint p) {
    (void)p;
 return nil; }
extern CGImageRef IKCGImageFromBitmapContext(void *ctx) {
    (void)ctx;
 return NULL; }
extern CGContextRef IKCGContextFromBitmapContext(void *ctx) {
    (void)ctx;
 return NULL; }
extern CFTypeRef IKCreateIOImageFromCGImage(CGImageRef image) {
    (void)image;
 return NULL; }
extern CGColorRef IKCreateCGColorWithColor(NSColor *color) {
    (void)color;
 return NULL; }
extern NSColor *IKCreateColorWithCGColor(CGColorRef color) {
    (void)color;
 return NULL; }
extern BOOL IKIsValidSizeForToolMode(CGSize size, NSString *mode) {
    (void)size; (void)mode;
 return YES; }
extern BOOL IKSizeFitsInRect(CGSize size, CGRect rect) {
    (void)size; (void)rect;
 return YES; }
extern BOOL IKHasReturnValueForSelector(id obj, SEL sel) {
    (void)obj; (void)sel;
 return NO; }
extern id IKUnretainedObjectForSelector(id obj, SEL sel) {
    (void)sel;
 return obj; }
extern BOOL IKIsValidRectForToolMode(CGRect rect, NSString *mode) {
    (void)rect; (void)mode;
 return YES; }
extern BOOL IKImageBrowserAllowsEmptySelection(id browser) {
    (void)browser;
 return YES; }
extern id IKImageBrowserCellForItemAtIndex(id browser, NSUInteger idx) {
    (void)browser; (void)idx;
 return nil; }
extern CGRect IKImageBrowserFrameForItemAtIndex(id browser, NSUInteger idx) {
    (void)browser; (void)idx;
 return CGRectZero; }
extern BOOL IKImageViewCanHandleImageType(NSString *type) {
    (void)type;
 return YES; }
extern id IKImageViewImageWithSize(NSImage *image, NSSize size) {
    (void)size;
 return image; }
extern id IKFilterBrowserViewSelectionIndexes(id view) {
    (void)view;
 return [NSIndexSet indexSet]; }
extern void IKFilterBrowserViewSetSelectionIndexes(id view, id indexes) {
    (void)view; (void)indexes;
 }
extern id IKPictureTakerOutputImage(id pt) {
    (void)pt;
 return nil; }
extern void IKPictureTakerSetOutputImage(id pt, id image) {
    (void)pt; (void)image;
 }
extern NSSize IKImageViewZoomToFitSize(id view) {
    (void)view;
 return NSMakeSize(100,100); }
extern double IKImageViewZoomFactor(id view) {
    (void)view;
 return 1.0; }
extern void IKApplyColorToContext(CGContextRef ctx, CGColorRef color) {
    (void)ctx; (void)color;
 }
extern CGAffineTransform IKTransformFromRectToRect(CGRect from, CGRect to) {
    (void)from; (void)to;
 return CGAffineTransformIdentity; }
extern id IKCreateCGBitmapContextWithSize(CGSize size, BOOL opaque) {
    (void)size; (void)opaque;
 return NULL; }
extern void IKRegisterDrawingLayerClass(id layerClass) {
    (void)layerClass;
 }
extern void IKUnregisterDrawingLayerClass(id layerClass) {
    (void)layerClass;
 }
extern NSBundle *IKImageKitBundle(void) { return [NSBundle bundleWithIdentifier:@"com.apple.imagekit"]; }
extern NSString *IKImageTypeIdentifierFromUTType(NSString *uttype) { return uttype; }
extern NSString *IKUTTypeFromImageTypeIdentifier(NSString *ident) { return ident; }
extern CGImageSourceRef IKCGImageSourceCreateFromImage(NSImage *image) {
    (void)image;
 return NULL; }
extern NSImage *IKImageFromCGImageSource(CGImageSourceRef source, NSDictionary *options) {
    (void)source; (void)options;
 return nil; }
extern CGImageRef IKCGImageFromNSImage(NSImage *image) {
    (void)image;
 return NULL; }
extern NSImage *IKNSImageFromCGImage(CGImageRef image) {
    (void)image;
 return nil; }
extern void IKImageCaptureDisableScreenFlash(void) { }
extern void IKImageCaptureEnableScreenFlash(void) { }
extern NSString *IKMediaTypeFromCGImageSource(CGImageSourceRef source) {
    (void)source;
 return nil; }
extern NSDictionary *IKPropertiesFromCGImageSource(CGImageSourceRef source) {
    (void)source;
 return nil; }
extern void IKSetImageWithUTType(NSImage *image, NSString *uttype) {
    (void)image; (void)uttype;
 }
extern BOOL IKIsHDRImage(NSImage *image) {
    (void)image;
 return NO; }
extern BOOL IKIsWideGamutImage(NSImage *image) {
    (void)image;
 return NO; }
extern BOOL IKHasDepthData(NSImage *image) {
    (void)image;
 return NO; }
extern BOOL IKIsImageURLSupported(NSURL *url) {
    (void)url;
 return YES; }
extern BOOL IKIsImageDataSupported(NSData *data) {
    (void)data;
 return YES; }
extern BOOL IKCanUseIconForFile(NSString *path) {
    (void)path;
 return NO; }
extern BOOL IKIsImageAtPathSupported(NSString *path) {
    (void)path;
 return YES; }
extern void IKSetColorSpaceForImage(NSImage *image, CGColorSpaceRef space) {
    (void)image; (void)space;
 }
extern CGColorSpaceRef IKColorSpaceForImage(NSImage *image) {
    (void)image;
 return NULL; }
extern NSArray *IKSupportedImageTypes(void) { return [NSArray array]; }
extern NSArray *IKImageTypesWithData(NSData *data) {
    (void)data;
 return [NSArray array]; }
extern NSArray *IKImageTypesWithURL(NSURL *url) {
    (void)url;
 return [NSArray array]; }
extern void IKSetFileTypeForImage(NSImage *image, NSString *type) {
    (void)image; (void)type;
 }
extern NSString *IKFileTypeForImage(NSImage *image) {
    (void)image;
 return @"public.jpeg"; }
extern NSData *IKBitmapDataFromImage(NSImage *image) {
    (void)image;
 return nil; }
extern NSArray *IKCreatePDFDocumentDataWithImage(NSImage *image) {
    (void)image;
 return nil; }
extern NSURL *IKSaveImage(NSImage *image, NSURL *url, NSString *type, NSDictionary *props) {
    (void)image; (void)type; (void)props;
 return url; }
extern NSString *IKCopyMetadataOfImageAtURL(NSURL *url, NSDictionary *opts) {
    (void)url; (void)opts;
 return nil; }
extern void IKSetMetadataForImage(NSImage *image, NSString *data) {
    (void)image; (void)data;
 }
extern NSString *IKMetadataForImage(NSImage *image) {
    (void)image;
 return nil; }
extern NSImage *IKCreateThumbnailForImage(NSImage *image, NSSize size) {
    (void)size;
 return image ? [image copy] : nil; }
extern BOOL IKIsImageRectSuitableForFaceCore(CGRect r) {
    (void)r;
 return YES; }
extern BOOL IKHasAlpha(NSImage *image) {
    (void)image;
 return YES; }
extern void IKDebugLog(NSString *msg) {
    (void)msg;
 }
extern BOOL IKIsCMYKImage(NSImage *image) {
    (void)image;
 return NO; }
extern CGImageRef IKCreateCGImageFromBitmapData(NSData *data) {
    (void)data;
 return NULL; }
extern NSImage *IKCreateImageFromBitmapData(NSData *data) {
    (void)data;
 return nil; }
extern NSString *IKImageSourceUTTypeIdentifierFromFileName(NSString *name) {
    (void)name;
 return @"public.image"; }
extern NSString *IKUTTypeStringForURL(NSURL *url) {
    (void)url;
 return @"public.image"; }
extern CGColorRef IKCreateCGColorFromNSColor(NSColor *color) {
    (void)color;
 return NULL; }
extern NSData *IKDataFromCGImage(CGImageRef img) {
    (void)img;
 return nil; }
extern CGSize IKSizeOfImage(NSImage *image) { return image ? [image size] : NSZeroSize; }
extern BOOL IKIsVectorImage(NSImage *image) {
    (void)image;
 return NO; }
extern BOOL IKIsGrayscaleImage(NSImage *image) {
    (void)image;
 return NO; }
extern BOOL IKIsBitmapImage(NSImage *image) {
    (void)image;
 return YES; }
extern void IKApplyFilter(NSImage *image, NSString *filterName, NSDictionary *params) {
    (void)image; (void)filterName; (void)params;
 }
extern NSArray *IKFilterNames(void) { return [NSArray array]; }
extern NSDictionary *IKFilterParameters(NSString *filterName) {
    (void)filterName;
 return [NSDictionary dictionary]; }
extern NSRect IKFitRect(NSRect rect, NSRect inRect) {
    (void)inRect;
 return rect; }
extern NSRect IKCenterRect(NSRect rect, NSRect inRect) {
    (void)inRect;
 return rect; }
extern NSRect IKRectWithSize(NSSize size) { return NSMakeRect(0,0,size.width,size.height); }
extern NSRect IKIntegralRect(NSRect rect) { return rect; }
extern NSRect IKOutsetRect(NSRect rect, CGFloat dx, CGFloat dy) {
    (void)dx; (void)dy;
 return rect; }
extern NSRect IKInsetRect(NSRect rect, CGFloat dx, CGFloat dy) {
    (void)dx; (void)dy;
 return rect; }
extern NSRect IKIntersectRect(NSRect r1, NSRect r2) { return NSIntersectionRect(r1,r2); }
extern NSRect IKCropRect(NSRect rect, CGFloat dw, CGFloat dh) {
    (void)dw; (void)dh;
 return rect; }
extern NSImage *IKImageFromCGImage(CGImageRef img) {
    (void)img;
 return nil; }
extern NSDictionary *IKProfileFromImage(NSImage *image) {
    (void)image;
 return [NSDictionary dictionary]; }
extern NSString *IKDescriptionForImage(NSImage *image) {
    (void)image;
 return nil; }
extern NSArray *IKProfilesForImage(NSImage *image) {
    (void)image;
 return [NSArray array]; }
extern BOOL IKIsRAWImage(NSImage *image) {
    (void)image;
 return NO; }
extern BOOL IKIsAnimatedImage(NSImage *image) {
    (void)image;
 return NO; }
extern NSTimeInterval IKAnimationDurationForImage(NSImage *image) {
    (void)image;
 return 0.0; }
extern NSUInteger IKAnimationFrameCountForImage(NSImage *image) {
    (void)image;
 return 0; }
extern NSImage *IKImageForFrame(NSImage *image, NSUInteger frame) {
    (void)frame;
 return image ? [image copy] : nil; }
extern BOOL IKIsRotationEnabledForImage(NSImage *image) {
    (void)image;
 return YES; }
extern BOOL IKIsCroppingEnabledForImage(NSImage *image) {
    (void)image;
 return YES; }
extern BOOL IKIsResizingEnabledForImage(NSImage *image) {
    (void)image;
 return YES; }
extern BOOL IKIsZoomingEnabledForImage(NSImage *image) {
    (void)image;
 return YES; }
extern BOOL IKIsFilteringEnabledForImage(NSImage *image) {
    (void)image;
 return YES; }
extern BOOL IKIsAnnotationsEnabledForImage(NSImage *image) {
    (void)image;
 return YES; }
extern BOOL IKIsAdjustmentsEnabledForImage(NSImage *image) {
    (void)image;
 return YES; }
extern BOOL IKIsEffectsEnabledForImage(NSImage *image) {
    (void)image;
 return YES; }
extern BOOL IKIsOptionsEnabledForImage(NSImage *image) {
    (void)image;
 return YES; }
extern BOOL IKIsInspectorEnabledForImage(NSImage *image) {
    (void)image;
 return YES; }

/* Generated stubs for remaining SDK export parity */

NSString *const IK_ApertureBundleIdentifier = @"IK_ApertureBundleIdentifier";
NSString *const IK_BADGEICON_FRAME = @"IK_BADGEICON_FRAME";
NSString *const IK_BADGEICON_SIZE = @"IK_BADGEICON_SIZE";
NSString *const IK_iPhotoBundleIdentifier = @"IK_iPhotoBundleIdentifier";
NSString *const IK_MailBundleIdentifier = @"IK_MailBundleIdentifier";
NSString *const IK_PhotosBundleIdentifier = @"IK_PhotosBundleIdentifier";
NSString *const IKAnimatePostRenderingChannel = @"IKAnimatePostRenderingChannel";
NSString *const IKAnimatePreRenderingChannel = @"IKAnimatePreRenderingChannel";
NSString *const IKAnimateRenderingChannel = @"IKAnimateRenderingChannel";
NSString *const IKAnimationDataKey = @"IKAnimationDataKey";
NSString *const IKAnimationDelayKey = @"IKAnimationDelayKey";
NSString *const IKAnimationDurationKey = @"IKAnimationDurationKey";
NSString *const IKAnimationFrameRateKey = @"IKAnimationFrameRateKey";
NSString *const IKAnimationGroups = @"IKAnimationGroups";
NSString *const IKAnimationMotionBlurKey = @"IKAnimationMotionBlurKey";
NSString *const IKAnimationPerspectiveValueKey = @"IKAnimationPerspectiveValueKey";
NSString *const IKAnimationsDidFinish = @"IKAnimationsDidFinish";
NSString *const IKAnimationStartTimeKey = @"IKAnimationStartTimeKey";
NSString *const IKAnimationVelocityCurveKey = @"IKAnimationVelocityCurveKey";
NSString *const IKCacheDidPurgeNotification = @"IKCacheDidPurgeNotification";
NSString *const IKCacheWillPurgeNotification = @"IKCacheWillPurgeNotification";
NSString *const IKCameraIrisStatusChangeNotification = @"IKCameraIrisStatusChangeNotification";
NSString *const IKCameraStatusChangeNotification = @"IKCameraStatusChangeNotification";
NSString *const IKDisableFontSmothing = @"IKDisableFontSmothing";
NSString *const IKFilterBrowserDefaultInputImage = @"IKFilterBrowserDefaultInputImage";
NSString *const IKFilterBrowserExcludeCategories = @"IKFilterBrowserExcludeCategories";
NSString *const IKFilterBrowserExcludeFilters = @"IKFilterBrowserExcludeFilters";
NSString *const IKFilterBrowserFilterDoubleClickNotification = @"IKFilterBrowserFilterDoubleClickNotification";
NSString *const IKFilterBrowserFilterSelectedNotification = @"IKFilterBrowserFilterSelectedNotification";
NSString *const IKFilterBrowserHideCancelAndOKButtons = @"IKFilterBrowserHideCancelAndOKButtons";
NSString *const IKFilterBrowserShowCategories = @"IKFilterBrowserShowCategories";
NSString *const IKFilterBrowserShowPreview = @"IKFilterBrowserShowPreview";
NSString *const IKFilterBrowserUseNarrowLayout = @"IKFilterBrowserUseNarrowLayout";
NSString *const IKFilterBrowserWillPreviewFilterNotification = @"IKFilterBrowserWillPreviewFilterNotification";
NSString *const IKFilterPboardType = @"IKFilterPboardType";
NSString *const IKFlipPositionAnimationTab = @"IKFlipPositionAnimationTab";
NSString *const IKFlipRotationAnimationTab = @"IKFlipRotationAnimationTab";
NSString *const IKHDRAnimationDuration = @"IKHDRAnimationDuration";
NSString *const IKIconCellDisableTwoLineTitlesKey = @"IKIconCellDisableTwoLineTitlesKey";
NSString *const IKIconCellStatusProgress = @"IKIconCellStatusProgress";
NSString *const IKIconCellStatusString = @"IKIconCellStatusString";
NSString *const IKIconCellStatusTextAttributes = @"IKIconCellStatusTextAttributes";
NSString *const IKIconCellTextSizeKey = @"IKIconCellTextSizeKey";
NSString *const IKIconCellTitlesOnRightKey = @"IKIconCellTitlesOnRightKey";
NSString *const IKImageBrowserAnimationAlphaChannel = @"IKImageBrowserAnimationAlphaChannel";
NSString *const IKImageBrowserAnimationAlphaKey = @"IKImageBrowserAnimationAlphaKey";
NSString *const IKImageBrowserAnimationGeometryChannel = @"IKImageBrowserAnimationGeometryChannel";
NSString *const IKImageBrowserAnimationGeometryKey = @"IKImageBrowserAnimationGeometryKey";
NSString *const IKImageBrowserBackgroundColorKey = @"IKImageBrowserBackgroundColorKey";
NSString *const IKImageBrowserCellBackgroundLayer = @"IKImageBrowserCellBackgroundLayer";
NSString *const IKImageBrowserCellForegroundLayer = @"IKImageBrowserCellForegroundLayer";
NSString *const IKImageBrowserCellLayerTypeBackground = @"IKImageBrowserCellLayerTypeBackground";
NSString *const IKImageBrowserCellLayerTypeForeground = @"IKImageBrowserCellLayerTypeForeground";
NSString *const IKImageBrowserCellLayerTypePlaceHolder = @"IKImageBrowserCellLayerTypePlaceHolder";
NSString *const IKImageBrowserCellLayerTypeSelection = @"IKImageBrowserCellLayerTypeSelection";
NSString *const IKImageBrowserCellPlaceHolderLayer = @"IKImageBrowserCellPlaceHolderLayer";
NSString *const IKImageBrowserCellsClippedHighlightedTitleAttributesKey = @"IKImageBrowserCellsClippedHighlightedTitleAttributesKey";
NSString *const IKImageBrowserCellsClippedHighlightedUnfocusedTitleAttributesKey = @"IKImageBrowserCellsClippedHighlightedUnfocusedTitleAttributesKey";
NSString *const IKImageBrowserCellsClippedTitleAttributesKey = @"IKImageBrowserCellsClippedTitleAttributesKey";
NSString *const IKImageBrowserCellSelectionLayer = @"IKImageBrowserCellSelectionLayer";
NSString *const IKImageBrowserCellsHaveSubtitlesBinding = @"IKImageBrowserCellsHaveSubtitlesBinding";
NSString *const IKImageBrowserCellsHaveTitlesBinding = @"IKImageBrowserCellsHaveTitlesBinding";
NSString *const IKImageBrowserCellsHighlightedSubtitleAttributesKey = @"IKImageBrowserCellsHighlightedSubtitleAttributesKey";
NSString *const IKImageBrowserCellsHighlightedTitleAttributesKey = @"IKImageBrowserCellsHighlightedTitleAttributesKey";
NSString *const IKImageBrowserCellsHighlightedUnfocusedTitleAttributesKey = @"IKImageBrowserCellsHighlightedUnfocusedTitleAttributesKey";
NSString *const IKImageBrowserCellsOutlineColorKey = @"IKImageBrowserCellsOutlineColorKey";
NSString *const IKImageBrowserCellsSubtitleAttributesKey = @"IKImageBrowserCellsSubtitleAttributesKey";
NSString *const IKImageBrowserCellsTitleAttributesKey = @"IKImageBrowserCellsTitleAttributesKey";
NSString *const IKImageBrowserCellsTruncatedHighlightedTitleAttributesKey = @"IKImageBrowserCellsTruncatedHighlightedTitleAttributesKey";
NSString *const IKImageBrowserCellsTruncatedHighlightedUnfocusedTitleAttributesKey = @"IKImageBrowserCellsTruncatedHighlightedUnfocusedTitleAttributesKey";
NSString *const IKImageBrowserCellsTruncatedTitleAttributesKey = @"IKImageBrowserCellsTruncatedTitleAttributesKey";
NSString *const IKImageBrowserCGImageRepresentationType = @"IKImageBrowserCGImageRepresentationType";
NSString *const IKImageBrowserCGImageSourceRepresentationType = @"IKImageBrowserCGImageSourceRepresentationType";
NSString *const IKImageBrowserCIImageRepresentationType = @"IKImageBrowserCIImageRepresentationType";
NSString *const IKImageBrowserDidFinishNicestRendering = @"IKImageBrowserDidFinishNicestRendering";
NSString *const IKImageBrowserDidStabilize = @"IKImageBrowserDidStabilize";
NSString *const IKImageBrowserFlavorCellPartKey = @"IKImageBrowserFlavorCellPartKey";
NSString *const IKImageBrowserFlavorGridSpacingKey = @"IKImageBrowserFlavorGridSpacingKey";
NSString *const IKImageBrowserFlavorIconSizeKey = @"IKImageBrowserFlavorIconSizeKey";
NSString *const IKImageBrowserFlavorMaxIconSizeKey = @"IKImageBrowserFlavorMaxIconSizeKey";
NSString *const IKImageBrowserFlavorShowItemInfoKey = @"IKImageBrowserFlavorShowItemInfoKey";
NSString *const IKImageBrowserFlavorTextAttributesKey = @"IKImageBrowserFlavorTextAttributesKey";
NSString *const IKImageBrowserFlavorTextSizeKey = @"IKImageBrowserFlavorTextSizeKey";
NSString *const IKImageBrowserFlavorTitlesOnRightKey = @"IKImageBrowserFlavorTitlesOnRightKey";
NSString *const IKImageBrowserGroupBackgroundColorKey = @"IKImageBrowserGroupBackgroundColorKey";
NSString *const IKImageBrowserGroupFooterLayer = @"IKImageBrowserGroupFooterLayer";
NSString *const IKImageBrowserGroupHeaderLayer = @"IKImageBrowserGroupHeaderLayer";
NSString *const IKImageBrowserGroupIdentifierKey = @"IKImageBrowserGroupIdentifierKey";
NSString *const IKImageBrowserGroupRangeKey = @"IKImageBrowserGroupRangeKey";
NSString *const IKImageBrowserGroupStyleKey = @"IKImageBrowserGroupStyleKey";
NSString *const IKImageBrowserGroupTagImageKey = @"IKImageBrowserGroupTagImageKey";
NSString *const IKImageBrowserGroupTitleKey = @"IKImageBrowserGroupTitleKey";
NSString *const IKImageBrowserIconRefPathRepresentationType = @"IKImageBrowserIconRefPathRepresentationType";
NSString *const IKImageBrowserIconRefRepresentationType = @"IKImageBrowserIconRefRepresentationType";
NSString *const IKImageBrowserNSBitmapImageRepresentationType = @"IKImageBrowserNSBitmapImageRepresentationType";
NSString *const IKImageBrowserNSDataRepresentationType = @"IKImageBrowserNSDataRepresentationType";
NSString *const IKImageBrowserNSImageRepresentationType = @"IKImageBrowserNSImageRepresentationType";
NSString *const IKImageBrowserNSURLRepresentationType = @"IKImageBrowserNSURLRepresentationType";
NSString *const IKImageBrowserOutlinesCellsBinding = @"IKImageBrowserOutlinesCellsBinding";
NSString *const IKImageBrowserPathRepresentationType = @"IKImageBrowserPathRepresentationType";
NSString *const IKImageBrowserPDFPageRepresentationType = @"IKImageBrowserPDFPageRepresentationType";
NSString *const IKImageBrowserPromisedRepresentationType = @"IKImageBrowserPromisedRepresentationType";
NSString *const IKImageBrowserQCCompositionPathRepresentationType = @"IKImageBrowserQCCompositionPathRepresentationType";
NSString *const IKImageBrowserQCCompositionRepresentationType = @"IKImageBrowserQCCompositionRepresentationType";
NSString *const IKImageBrowserQTMoviePathRepresentationType = @"IKImageBrowserQTMoviePathRepresentationType";
NSString *const IKImageBrowserQTMovieRepresentationType = @"IKImageBrowserQTMovieRepresentationType";
NSString *const IKImageBrowserQuickLookPathRepresentationType = @"IKImageBrowserQuickLookPathRepresentationType";
NSString *const IKImageBrowserSelectionColorKey = @"IKImageBrowserSelectionColorKey";
NSString *const IKImageBrowserShadowsCellsBinding = @"IKImageBrowserShadowsCellsBinding";
NSString *const IKImageBrowserTaskAbortMethod = @"IKImageBrowserTaskAbortMethod";
NSString *const IKImageBrowserTaskDelayMethod = @"IKImageBrowserTaskDelayMethod";
NSString *const IKImageBrowserTaskGetProgressMethod = @"IKImageBrowserTaskGetProgressMethod";
NSString *const IKImageBrowserTaskManagerEndNotification = @"IKImageBrowserTaskManagerEndNotification";
NSString *const IKImageBrowserTaskManagerStartNotification = @"IKImageBrowserTaskManagerStartNotification";
NSString *const IKImageBrowserTaskManagerTaskBeginNotification = @"IKImageBrowserTaskManagerTaskBeginNotification";
NSString *const IKImageBrowserTaskManagerTaskDoneNotification = @"IKImageBrowserTaskManagerTaskDoneNotification";
NSString *const IKImageBrowserTaskPriorityMethod = @"IKImageBrowserTaskPriorityMethod";
NSString *const IKImageBrowserTaskStartMethod = @"IKImageBrowserTaskStartMethod";
NSString *const IKImageBrowserZoomValueBinding = @"IKImageBrowserZoomValueBinding";
NSString *const IKImageCompletedInitialLoadingNotification = @"IKImageCompletedInitialLoadingNotification";
NSString *const IKImageCompletedTileLoadNotification = @"IKImageCompletedTileLoadNotification";
NSString *const IKImageFlowAnimationAlphaChannel = @"IKImageFlowAnimationAlphaChannel";
NSString *const IKImageFlowAnimationImportChannel = @"IKImageFlowAnimationImportChannel";
NSString *const IKImageFlowAnimationOffsetKey = @"IKImageFlowAnimationOffsetKey";
NSString *const IKImageFlowAnimationPositionChannel = @"IKImageFlowAnimationPositionChannel";
NSString *const IKImageFlowAnimationPositionKey = @"IKImageFlowAnimationPositionKey";
NSString *const IKImageFlowAnimationScrollChannel = @"IKImageFlowAnimationScrollChannel";
NSString *const IKImageFlowAnimationScrollingChannel = @"IKImageFlowAnimationScrollingChannel";
NSString *const IKImageFlowImportAnimationStyle = @"IKImageFlowImportAnimationStyle";
NSString *const IKImageFlowSpecularLight = @"IKImageFlowSpecularLight";
NSString *const IKImageFlowSubtitleAttributesKey = @"IKImageFlowSubtitleAttributesKey";
NSString *const IKImageFlowTitleAttributesKey = @"IKImageFlowTitleAttributesKey";
NSString *const IKImageViewDefaultImageIndex = @"IKImageViewDefaultImageIndex";
NSString *const IKImageViewLoadingDidFailNotification = @"IKImageViewLoadingDidFailNotification";
NSString *const IKImageViewMinRequiredScreenHeadroomForHDR = @"IKImageViewMinRequiredScreenHeadroomForHDR";
NSString *const IKInlinePreviewImage = @"IKInlinePreviewImage";
NSString *const IKOpenGLContextWillDie = @"IKOpenGLContextWillDie";
NSString *const IKPictureTakerAllowsEditingKey = @"IKPictureTakerAllowsEditingKey";
NSString *const IKPictureTakerCustomSourcesKey = @"IKPictureTakerCustomSourcesKey";
NSString *const IKPictureTakerEnableFaceDetectionKey = @"IKPictureTakerEnableFaceDetectionKey";
NSString *const IKPictureTakerImageTransformsKey = @"IKPictureTakerImageTransformsKey";
NSString *const IKPictureTakerInformationalTextKey = @"IKPictureTakerInformationalTextKey";
NSString *const IKPictureTakerShowAddressBookPicture = @"IKPictureTakerShowAddressBookPicture";
NSString *const IKPictureTakerShowAddressBookPictureKey = @"IKPictureTakerShowAddressBookPictureKey";
NSString *const IKPictureTakerShowChatIconsKey = @"IKPictureTakerShowChatIconsKey";
NSString *const IKPictureTakerShowEmptyPicture = @"IKPictureTakerShowEmptyPicture";
NSString *const IKPictureTakerShowEmptyPictureKey = @"IKPictureTakerShowEmptyPictureKey";
NSString *const IKPictureTakerShowRecentPictureKey = @"IKPictureTakerShowRecentPictureKey";
NSString *const IKPictureTakerShowUserPicturesKey = @"IKPictureTakerShowUserPicturesKey";
NSString *const IKPictureTakerSourceDefaults = @"IKPictureTakerSourceDefaults";
NSString *const IKPictureTakerSourceKey = @"IKPictureTakerSourceKey";
NSString *const IKPictureTakerSourceRecentPictures = @"IKPictureTakerSourceRecentPictures";
NSString *const IKProfilePictureAttributedImageName = @"IKProfilePictureAttributedImageName";
NSString *const IKProfilePictureEditorCropSizeKey = @"IKProfilePictureEditorCropSizeKey";
NSString *const IKProfilePictureEditorCustomSourcesKey = @"IKProfilePictureEditorCustomSourcesKey";
NSString *const IKProfilePictureEditorHidePhotoStreamPictureKey = @"IKProfilePictureEditorHidePhotoStreamPictureKey";
NSString *const IKProfilePictureEditorHideRecentPicturesKey = @"IKProfilePictureEditorHideRecentPicturesKey";
NSString *const IKProfilePictureEditorInputRectKey = @"IKProfilePictureEditorInputRectKey";
NSString *const IKProfilePictureEditorShowAddressBookPictureKey = @"IKProfilePictureEditorShowAddressBookPictureKey";
NSString *const IKProfilePictureEditorShowChatIconsKey = @"IKProfilePictureEditorShowChatIconsKey";
NSString *const IKProfilePictureEditorShowEmptyPictureKey = @"IKProfilePictureEditorShowEmptyPictureKey";
NSString *const IKProfilePictureEditorUpdateRecentPictureKey = @"IKProfilePictureEditorUpdateRecentPictureKey";
NSString *const IKProfilePictureEditorViewSizeKey = @"IKProfilePictureEditorViewSizeKey";
NSString *const IKQuickLookContentRect = @"IKQuickLookContentRect";
NSString *const IKQuickLookProperties = @"IKQuickLookProperties";
NSString *const IKSaveOptionsDefaultCompressionQuality = @"IKSaveOptionsDefaultCompressionQuality";
NSString *const IKSizeHint = @"IKSizeHint";
NSString *const IKSlideshowAudioFile = @"IKSlideshowAudioFile";
NSString *const IKSlideshowAutoShowMenuBar = @"IKSlideshowAutoShowMenuBar";
NSString *const IKSlideshowModeImages = @"IKSlideshowModeImages";
NSString *const IKSlideshowModeOther = @"IKSlideshowModeOther";
NSString *const IKSlideshowModePDF = @"IKSlideshowModePDF";
NSString *const IKSlideshowModeQuickLook = @"IKSlideshowModeQuickLook";
NSString *const IKSlideshowPDFDisplayBox = @"IKSlideshowPDFDisplayBox";
NSString *const IKSlideshowPDFDisplayMode = @"IKSlideshowPDFDisplayMode";
NSString *const IKSlideshowPDFDisplaysAsBook = @"IKSlideshowPDFDisplaysAsBook";
NSString *const IKSlideshowScreen = @"IKSlideshowScreen";
NSString *const IKSlideshowStartIndex = @"IKSlideshowStartIndex";
NSString *const IKSlideshowStartPaused = @"IKSlideshowStartPaused";
NSString *const IKSlideshowWrapAround = @"IKSlideshowWrapAround";
NSString *const IKTaskAbortMethod = @"IKTaskAbortMethod";
NSString *const IKTaskDelayMethod = @"IKTaskDelayMethod";
NSString *const IKTaskGetProgressMethod = @"IKTaskGetProgressMethod";
NSString *const IKTaskManagerEndNotification = @"IKTaskManagerEndNotification";
NSString *const IKTaskManagerStartNotification = @"IKTaskManagerStartNotification";
NSString *const IKTaskManagerTaskBeginNotification = @"IKTaskManagerTaskBeginNotification";
NSString *const IKTaskManagerTaskDoneNotification = @"IKTaskManagerTaskDoneNotification";
NSString *const IKTaskPriorityMethod = @"IKTaskPriorityMethod";
NSString *const IKTaskStartMethod = @"IKTaskStartMethod";
NSString *const IKThumbnailCount = @"IKThumbnailCount";
NSString *const IKThumbnailImageSize = @"IKThumbnailImageSize";
NSString *const IKTransactionCellIndexes = @"IKTransactionCellIndexes";
NSString *const IKTypePDF = @"IKTypePDF";
NSString *const IKTypeTIFF = @"IKTypeTIFF";
NSString *const IKUIFlavorAllowFallback = @"IKUIFlavorAllowFallback";
NSString *const IKUImaxSize = @"IKUImaxSize";
NSString *const IKUISizeFlavor = @"IKUISizeFlavor";
NSString *const IKUISizeMini = @"IKUISizeMini";
NSString *const IKUISizeRegular = @"IKUISizeRegular";
NSString *const IKUISizeSmall = @"IKUISizeSmall";
NSString *const IKUTTypeHEIC = @"IKUTTypeHEIC";
NSString *const IKUTTypePostScript = @"IKUTTypePostScript";
NSString *const IKUTTypeQuicktimeMovie = @"IKUTTypeQuicktimeMovie";
NSString *const IKZeroInset = @"IKZeroInset";

extern void IK_CGContextErase(void) { }
extern BOOL IK_InInterfaceBuilderApp(void) { return NO; }
extern CGRect IK_NSEdgeInsetsInsetRect(void) { return CGRectZero; }
extern BOOL IKAppPreferencesBoolValueForKey(void) { return NO; }
extern CGFloat IKAppPreferencesFloatValueForKey(void) { return 0.0; }
extern void IKArrayOfCellsWillDie(void) { }
extern id IKBestRepresentationFromNSImageForPhysicalSize(void) { return nil; }
extern id IKBitmapRepFromRawData(void) { return nil; }
extern CGFloat IKBoundedSquareSizeForSize(void) { return 0.0; }
extern NSString * IKBuildUniquePathWithPath(void) { return nil; }
extern NSBundle * IKBundle(void) { return [NSBundle bundleWithIdentifier:@"com.apple.imagekit"]; }
extern CGSize IKCacheSizeForImageSize(void) { return CGSizeZero; }
extern NSInteger IKCellCompareTextRects(void) { return 0; }
extern BOOL IKCompareCGImages(void) { return NO; }
extern id IKConstraintsInfo(void) { return nil; }
extern void IKCopyOpenGLTexture(void) { }
extern CGContextRef IKCreateCGContextRefFromData(void) { return NULL; }
extern CGContextRef IKCreateCGContextRefFromNSBitmapImageRep(void) { return NULL; }
extern CGContextRef IKCreateCGContextRefFromNSImage(void) { return NULL; }
extern void IKCreateIconRefFromPath(void) { }
extern id IKCreateIconRefFromURL(void) { return nil; }
extern id IKCreateOpenglTextureRGBA(void) { return nil; }
extern id IKCreateUniqueURLWithURL(void) { return nil; }
extern id IKCurrentTime(void) { return nil; }
extern id IKDecelerateTime(void) { return nil; }
extern CGSize IKDefaultPaperSize(void) { return CGSizeZero; }
extern id IKDesktopDirectory(void) { return nil; }
extern id IKDocumentDirectory(void) { return nil; }
extern id IKDownloadsDirectory(void) { return nil; }
extern id IKDumpConstraints(void) { return nil; }
extern id IKDumpContraintsForView(void) { return nil; }
extern CGRect IKEdgeInsetsInsetRect(void) { return CGRectZero; }
extern CGRect IKEdgeInsetsOutsetRect(void) { return CGRectZero; }
extern NSString * IKEditPanelLocalizedString(void) { return nil; }
extern id IKErrorStringFromICError(void) { return nil; }
extern NSString * IKExtensionForFileType(void) { return nil; }
extern NSString * IKFastThumbnailImageFromPath(void) { return nil; }
extern id IKFastThumbnailImageFromSourceRef(void) { return nil; }
extern id IKFBOSupported(void) { return nil; }
extern NSString * IKFileURLWithFolderNameAndType(void) { return nil; }
extern void IKFlowInlinePreviewLayerTreeDidUpdate(void) { }
extern CGRect IKFrameRect(void) { return CGRectZero; }
extern id IKFrameRectWithShadow(void) { return nil; }
extern id IKGIFConsumerPutBytes(void) { return nil; }
extern void IKGIFConsumerRelease(void) { }
extern BOOL IKGLExtensionIsSupported(void) { return NO; }
extern id IKGLExtensionsAreSupported(void) { return nil; }
extern id IKGroupInnerPoints(void) { return nil; }
extern id IKHiDPIGlobalScaleFactor(void) { return nil; }
extern id IKHiDPIScaleFactor(void) { return nil; }
extern NSString * IKIconImageFromPath(void) { return nil; }
extern id IKIconImageFromURL(void) { return nil; }
extern void IKImageBrowserInlinePreviewLayerTreeDidUpdate(void) { }
extern id IKImageCropClockwise(void) { return nil; }
extern id IKImageCropRotatePointFromPivot(void) { return nil; }
extern id IKImageCropZeroTo2PI(void) { return nil; }
extern NSString * IKImageIOLocalizedString(void) { return nil; }
extern id IKImageWithMovieHoles(void) { return nil; }
extern NSInteger IKInitDebugFlags(void) { return 0; }
extern id IKInsetForBorderSides(void) { return nil; }
extern void IKIntersectionOfIndexSet(void) { }
extern BOOL IKIsGLAccelerated(void) { return NO; }
extern CGSize IKLabelForPaperSize(void) { return CGSizeZero; }
extern NSInteger IKLimitIndexSetToCount(void) { return 0; }
extern NSInteger IKLimitRangeToCount(void) { return 0; }
extern id IKLoadShader(void) { return nil; }
extern id IKLoadShaderNamed(void) { return nil; }
extern id IKMiddleIndexInRange(void) { return nil; }
extern id IKMiddleIndexInRangeWithCenter(void) { return nil; }
extern id IKMoviesDirectory(void) { return nil; }
extern id IKNSBitmapImageFromOpenGLTexture(void) { return nil; }
extern id IKNSBitmapImageRepFromCGImage(void) { return nil; }
extern id IKNSBitmapImageRepFromFrameBuffer(void) { return nil; }
extern id IKNSBitmapImageRepFromNSImage(void) { return nil; }
extern id IKNSImageFromCGBitmapContextRef(void) { return nil; }
extern id IKNSImageFromCGImageSourceRef(void) { return nil; }
extern id IKNSImageFromCIImage(void) { return nil; }
extern CGSize IKNSImageFromCIImageWithSize(void) { return CGSizeZero; }
extern id IKNv11OrNv17Driver(void) { return nil; }
extern id IKOpenGLTextureIDFromCGBitmapContext(void) { return nil; }
extern id IKOpenGLTextureIDFromNSBitmapImageRep(void) { return nil; }
extern id IKOpenGLVersion(void) { return nil; }
extern id IKPathClipToPlane(void) { return nil; }
extern CGRect IKPathClipToRect(void) { return CGRectZero; }
extern id IKPicturesDirectory(void) { return nil; }
extern id IKPictureTakerHostInterface(void) { return nil; }
extern id IKPictureTakerServiceInterface(void) { return nil; }
extern id IKPlaceHolderImage(void) { return nil; }
extern id IKPlaceHolderInvImage(void) { return nil; }
extern id IKPreferencesGetBoolean(void) { return nil; }
extern id IKProfilePictureDrawRolloverTriangle(void) { return nil; }
extern NSString * IKPushRoundedPath(void) { return nil; }
extern CGRect IKPushRoundedRect(void) { return CGRectZero; }
extern NSString * IKQuickLookImageWithPath(void) { return nil; }
extern void IKRangeIncludingIndexSet(void) { }
extern id IKRawDataLengthForBitmapRep(void) { return nil; }
extern CGRect IKRectByInsettingRect(void) { return CGRectZero; }
extern id IKRegisterTextureRange(void) { return nil; }
extern CGRect IKRoundRect(void) { return CGRectZero; }
extern id IKRunLoopModes(void) { return nil; }
extern id IKShowBacktrace(void) { return nil; }
extern id IKSigmoide(void) { return nil; }
extern id IKTextInvertColorsForRendering(void) { return nil; }
extern id IKTextureRangeForAddress(void) { return nil; }
extern CGSize IKThumbSizeFromSize(int size) { (void)size; return CGSizeZero; }
extern id IKTimeDifference(void) { return nil; }
extern id IKTimeSinceTime(void) { return nil; }
extern id IKTimingFunctionSolve(void) { return nil; }
extern void IKUnionOfIndexSet(void) { }
extern id IKUnregisterTextureRange(void) { return nil; }
extern id IKUpdateOpenGLTextureWithCGBitmapContext(void) { return nil; }
extern CGRect IKUpdateOpenGLTextureWithCGBitmapContextRect(void) { return CGRectZero; }
extern id IKUpdateOpenGLTextureWithNSBitmapImageRep(void) { return nil; }
extern CGRect IKUpdateOpenGLTextureWithNSBitmapImageRepRect(void) { return CGRectZero; }
extern id IKWriteCGBitmapContextToFile(void) { return nil; }
extern id IKWriteOpenGLTextureToFile(void) { return nil; }
