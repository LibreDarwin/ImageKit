/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 */

#import "IKImageView.h"

NSString *const IKToolModeNone = @"IKToolModeNone";
NSString *const IKToolModeMove = @"IKToolModeMove";
NSString *const IKToolModeSelect = @"IKToolModeSelect";
NSString *const IKToolModeSelectRect = @"IKToolModeSelectRect";
NSString *const IKToolModeSelectEllipse = @"IKToolModeSelectEllipse";
NSString *const IKToolModeSelectLasso = @"IKToolModeSelectLasso";
NSString *const IKToolModeCrop = @"IKToolModeCrop";
NSString *const IKToolModeRotate = @"IKToolModeRotate";
NSString *const IKToolModeAnnotate = @"IKToolModeAnnotate";

NSString *const IKOverlayTypeBackground = @"IKOverlayTypeBackground";
NSString *const IKOverlayTypeImage = @"IKOverlayTypeImage";

@implementation IKImageView

@synthesize delegate = _delegate;
@synthesize zoomFactor = _zoomFactor;
@synthesize rotationAngle = _rotationAngle;
@synthesize currentToolMode = _currentToolMode;
@synthesize autoresizes = _autoresizes;
@synthesize hasHorizontalScroller = _hasHorizontalScroller;
@synthesize hasVerticalScroller = _hasVerticalScroller;
@synthesize hasZoomSlider = _hasZoomSlider;
@synthesize zoomSliderVisible = _zoomSliderVisible;
@synthesize overlayType = _overlayType;
@synthesize imageCorrection = _imageCorrection;
@synthesize supportsDragAndDrop = _supportsDragAndDrop;
@synthesize editable = _editable;
@synthesize doubleClickOpensImageEditPanel = _doubleClickOpensImageEditPanel;
@synthesize autohidesScrollers = _autohidesScrollers;
@synthesize allowsMultipleSelection = _allowsMultipleSelection;
@synthesize rotationAngleInDegrees = _rotationAngleInDegrees;
@synthesize currentRotationAngle = _currentRotationAngle;
@synthesize currentZoomFactor = _currentZoomFactor;

- (instancetype)initWithFrame:(NSRect)frameRect
{
    self = [super initWithFrame:frameRect];
    if (self)
    {
        _zoomFactor = 1.0;
        _rotationAngle = 0.0;
        _currentToolMode = [IKToolModeNone copy];
        _autoresizes = YES;
        _hasHorizontalScroller = NO;
        _hasVerticalScroller = NO;
        _hasZoomSlider = NO;
        _zoomSliderVisible = NO;
        _overlayType = [IKOverlayTypeBackground copy];
        _supportsDragAndDrop = YES;
        _editable = NO;
        _doubleClickOpensImageEditPanel = YES;
        _autohidesScrollers = NO;
        _allowsMultipleSelection = NO;
        _rotationAngleInDegrees = 0;
        _currentRotationAngle = 0.0;
        _currentZoomFactor = 1.0;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self)
    {
        _zoomFactor = 1.0;
        _rotationAngle = 0.0;
        _currentToolMode = [IKToolModeNone copy];
        _autoresizes = YES;
        _hasHorizontalScroller = NO;
        _hasVerticalScroller = NO;
        _hasZoomSlider = NO;
        _zoomSliderVisible = NO;
        _overlayType = [IKOverlayTypeBackground copy];
        _supportsDragAndDrop = YES;
        _editable = NO;
        _doubleClickOpensImageEditPanel = YES;
        _autohidesScrollers = NO;
        _allowsMultipleSelection = NO;
        _rotationAngleInDegrees = 0;
        _currentRotationAngle = 0.0;
        _currentZoomFactor = 1.0;
    }
    return self;
}

- (void)dealloc
{
#if !__has_feature(objc_arc)
    [_currentToolMode release];
    [_overlayType release];
    [_imageCorrection release];
    [super dealloc];
#endif
}

- (void)setRotationAngle:(CGFloat)rotationAngle centerPoint:(NSPoint)centerPoint
{
    _rotationAngle = rotationAngle;
    _currentRotationAngle = rotationAngle;
    _rotationAngleInDegrees = (NSInteger)round(rotationAngle * 180.0 / M_PI);
}

- (void)setImage:(id)image imageProperties:(NSDictionary *)metaData
{
}

- (void)setImageWithURL:(NSURL *)url
{
}

- (void)setImageZoomFactor:(CGFloat)factor centerPoint:(NSPoint)centerPoint
{
    _zoomFactor = factor;
    _currentZoomFactor = factor;
}

- (void)rotateLeft:(id)sender
{
    self.rotationAngle -= M_PI_2;
}

- (void)rotateRight:(id)sender
{
    self.rotationAngle += M_PI_2;
}

- (void)zoomIn:(id)sender
{
    self.zoomFactor *= 1.5;
}

- (void)zoomOut:(id)sender
{
    self.zoomFactor /= 1.5;
}

- (void)zoomImageToRect:(NSRect)rect
{
}

- (void)zoomImageToFit:(id)sender
{
}

- (void)zoomImageToActualSize:(id)sender
{
    self.zoomFactor = 1.0;
}

- (void)flipImageHorizontal:(id)sender
{
}

- (void)flipImageVertical:(id)sender
{
}

- (void)setOverlay:(id)image forType:(NSString *)layerType
{
}

- (id)overlayForType:(NSString *)layerType
{
    return nil;
}

- (void)scrollToRect:(NSRect)rect
{
}

- (NSRect)convertViewPointToImagePoint:(NSPoint)viewPoint
{
    return NSMakeRect(viewPoint.x, viewPoint.y, 0, 0);
}

- (NSPoint)convertImagePointToViewPoint:(NSPoint)imagePoint
{
    return imagePoint;
}

- (NSRect)convertViewRectToImageRect:(NSRect)viewRect
{
    return viewRect;
}

- (NSRect)convertImageRectToViewRect:(NSRect)imageRect
{
    return imageRect;
}

- (void)crop:(id)sender
{
}

- (void)cut:(id)sender
{
}

- (void)copy:(id)sender
{
}

- (void)paste:(id)sender
{
}

- (void)delete:(id)sender
{
}

- (void)selectAll:(id)sender
{
}

- (void)selectNone:(id)sender
{
}

- (void)setImageWithImage:(id)image
{
}

- (id)image
{
    return nil;
}

- (void)setImageName:(NSString *)name
{
}

- (NSString *)imageName
{
    return nil;
}

/* --- generated selector-parity stubs --- */
+ (id)imageFromCGImage:(id)arg1 imageProperties:(id)arg2 imageState:(id)arg3 options:(id)arg4
{
    return nil;
}

+ (id)imageFromURL:(id)arg1 imageState:(id)arg2 options:(id)arg3
{
    return nil;
}

- (id)_didInitWithCoder
{
    return nil;
}

- (id)_didInitWithCoder:(id)arg1
{
    return nil;
}

- (id)_willInitWithCoder
{
    return nil;
}

- (id)addLayer:(id)arg1 linkedTo:(id)arg2
{
    return nil;
}

- (id)annotationType
{
    return nil;
}

- (id)autoResizeToRect:(id)arg1
{
    return nil;
}

- (id)backgroundLayer
{
    return nil;
}

- (id)centerImage
{
    return nil;
}

- (id)closeInspector:(id)arg1
{
    return nil;
}

- (id)commonInit
{
    return nil;
}

- (id)composer
{
    return nil;
}

- (id)connectToBackgroundLayer
{
    return nil;
}

- (id)createThumbnailOfSize:(id)arg1
{
    return nil;
}

- (id)createThumbnailWithMaximumSize:(id)arg1
{
    return nil;
}

- (id)debugLayerTree:(id)arg1
{
    return nil;
}

- (id)dump
{
    return nil;
}

- (id)dumpLayer:(id)arg1 prefix:(id)arg2
{
    return nil;
}

- (id)dumpLayer:(id)arg1 prefix:(id)arg2 verbose:(id)arg3
{
    return nil;
}

- (id)embedded
{
    return nil;
}

- (id)filter:(id)arg1 setValue:(id)arg2 forKey:(id)arg3
{
    return nil;
}

- (id)filter:(id)arg1 valueForKey:(id)arg2
{
    return nil;
}

- (id)filterAdded:(id)arg1 filterChain:(id)arg2
{
    return nil;
}

- (id)filterArray
{
    return nil;
}

- (id)filterChain
{
    return nil;
}

- (id)filterChainChanged:(id)arg1
{
    return nil;
}

- (id)filterRemoved:(id)arg1 filterChain:(id)arg2
{
    return nil;
}

- (id)handleViewDidMoveToSuperView
{
    return nil;
}

- (id)ibSetSampleURL
{
    return nil;
}

- (id)imageLayer
{
    return nil;
}

- (id)imageProperties
{
    return nil;
}

- (id)imageSize
{
    return nil;
}

- (id)imageState:(id)arg1 image:(id)arg2 options:(id)arg3
{
    return nil;
}

- (id)imageURL
{
    return nil;
}

- (id)imageWithOptions:(id)arg1
{
    return nil;
}

- (id)invalidateCursorRects
{
    return nil;
}

- (id)layerOfType:(id)arg1
{
    return nil;
}

- (id)postZoom
{
    return nil;
}

- (id)preZoom
{
    return nil;
}

- (id)registerLayer:(id)arg1
{
    return nil;
}

- (id)removeLayer:(id)arg1
{
    return nil;
}

- (id)rotateImageLeft:(id)arg1
{
    return nil;
}

- (id)rotateImageRight:(id)arg1
{
    return nil;
}

- (id)saveScrollInfo:(id)arg1 scaling:(id)arg2
{
    return nil;
}

- (id)selectionRect
{
    return nil;
}

- (id)selectionRectAdded
{
    return nil;
}

- (id)selectionRectDidChange:(id)arg1
{
    return nil;
}

- (id)selectionRectRemoved
{
    return nil;
}

- (void)setAnnotationType:(id)arg1
{

}

- (id)setCIImage:(id)arg1 imageProperties:(id)arg2
{
    return nil;
}

- (void)setEmbedded:(id)arg1
{

}

- (void)setFilterArray:(id)arg1
{

}

- (void)setFilterChain:(id)arg1
{

}

- (id)setImage:(id)arg1 imageProperties:(id)arg2 imageState:(id)arg3
{
    return nil;
}

- (id)setImage:(id)arg1 imageProperties:(id)arg2 imageState:(id)arg3 options:(id)arg4
{
    return nil;
}

- (id)setImage:(id)arg1 imageProperties:(id)arg2 options:(id)arg3
{
    return nil;
}

- (void)setImageWithCGImageSource:(id)arg1
{

}

- (id)setImageWithCGImageSource:(id)arg1 imageProperties:(id)arg2 options:(id)arg3
{
    return nil;
}

- (void)setImageWithData:(id)arg1
{

}

- (id)setImageWithData:(id)arg1 imageProperties:(id)arg2 options:(id)arg3
{
    return nil;
}

- (id)setImageWithURL:(id)arg1 imageState:(id)arg2
{
    return nil;
}

- (id)setImageWithURL:(id)arg1 imageState:(id)arg2 options:(id)arg3
{
    return nil;
}

- (id)setNSImage:(id)arg1 imageProperties:(id)arg2
{
    return nil;
}

- (void)setReuseImageLayer:(id)arg1
{

}

- (void)setSelectionRect:(id)arg1
{

}

- (void)setValueURL:(id)arg1
{

}

- (id)showInspector:(id)arg1
{
    return nil;
}

- (id)turnoffAutoresizes
{
    return nil;
}

- (id)updateBackgroundColor
{
    return nil;
}

- (id)updateImageEditPanelIfNeeded
{
    return nil;
}

- (id)valueURL
{
    return nil;
}

- (id)writeImageAtIndex:(id)arg1 toFile:(id)arg2 options:(id)arg3
{
    return nil;
}
@end

NSString *const IKToolModePaste = @"IKToolModePaste";
NSString *const IKToolModeSelectRectImageCapture = @"IKToolModeSelectRectImageCapture";
