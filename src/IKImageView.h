/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 */

#ifndef IKImageView_h
#define IKImageView_h

#import <AppKit/NSView.h>
#import <QuartzCore/QuartzCore.h>
#import "ImageKitBase.h"

extern NSString *const IKToolModeNone;
extern NSString *const IKToolModeMove;
extern NSString *const IKToolModeSelect;
extern NSString *const IKToolModeSelectRect;
extern NSString *const IKToolModeSelectEllipse;
extern NSString *const IKToolModeSelectLasso;
extern NSString *const IKToolModeCrop;
extern NSString *const IKToolModeRotate;
extern NSString *const IKToolModeAnnotate;

extern NSString *const IKOverlayTypeBackground;
extern NSString *const IKOverlayTypeImage;

IK_CLASS_AVAILABLE(10.5)
@interface IKImageView : NSView
{
@private
    void * _privateData;
}

@property(assign) IBOutlet id delegate;
@property CGFloat zoomFactor;
@property CGFloat rotationAngle;
@property(copy) NSString * currentToolMode;
@property BOOL autoresizes;
@property BOOL hasHorizontalScroller;
@property BOOL hasVerticalScroller;
@property BOOL hasZoomSlider;
@property BOOL zoomSliderVisible;
@property(copy) NSString * overlayType;
@property(retain) CIFilter * imageCorrection;
@property BOOL supportsDragAndDrop;
@property BOOL editable;
@property BOOL doubleClickOpensImageEditPanel;
@property BOOL autohidesScrollers;
@property BOOL allowsMultipleSelection;
@property NSInteger rotationAngleInDegrees;
@property(readonly) CGFloat currentRotationAngle;
@property(readonly) CGFloat currentZoomFactor;

- (void)setRotationAngle:(CGFloat)rotationAngle centerPoint:(NSPoint)centerPoint;
- (void)setImage:(id)image imageProperties:(NSDictionary *)metaData;
- (void)setImageWithURL:(NSURL *)url;
- (void)setImageZoomFactor:(CGFloat)factor centerPoint:(NSPoint)centerPoint;
- (void)rotateLeft:(id)sender;
- (void)rotateRight:(id)sender;
- (void)zoomIn:(id)sender;
- (void)zoomOut:(id)sender;
- (void)zoomImageToRect:(NSRect)rect;
- (void)zoomImageToFit:(id)sender;
- (void)zoomImageToActualSize:(id)sender;
- (void)flipImageHorizontal:(id)sender;
- (void)flipImageVertical:(id)sender;
- (void)setOverlay:(id)image forType:(NSString *)layerType;
- (id)overlayForType:(NSString *)layerType;
- (void)scrollToRect:(NSRect)rect;
- (NSRect)convertViewPointToImagePoint:(NSPoint)viewPoint;
- (NSPoint)convertImagePointToViewPoint:(NSPoint)imagePoint;
- (NSRect)convertViewRectToImageRect:(NSRect)viewRect;
- (NSRect)convertImageRectToViewRect:(NSRect)imageRect;
- (void)crop:(id)sender;
- (void)cut:(id)sender;
- (void)copy:(id)sender;
- (void)paste:(id)sender;
- (void)delete:(id)sender;
- (void)selectAll:(id)sender;
- (void)selectNone:(id)sender;
@end

#endif /* IKImageView_h */
