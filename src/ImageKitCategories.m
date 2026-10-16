/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 */

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
#import <QuartzCore/QuartzCore.h>
#import <CoreImage/CoreImage.h>
#import <ImageCaptureCore/ImageCaptureCore.h>

#import "IKCameraDeviceViewHandler.h"
#import "IKDatasourceDiffResult.h"
#import "IKHierarchicalDatasourceAdaptor.h"
#import "IKImageBrowserCell.h"
#import "IKImageBrowserView.h"
#import "IKImageCropView.h"
#import "IKImageEditPanel.h"
#import "IKImageFlowCell.h"
#import "IKImageFlowView.h"
#import "IKImageState.h"
#import "IKImageView.h"
#import "IKImageView2.h"
#import "IKPictureTakerRecentPicture.h"
#import "IKSSBackgroundWindow.h"
#import "IKScanUIControllerAdvanced.h"

@implementation CALayer (IKImageView2Transforms)

- (void)setAnchorPointWithoutShift:(id)arg1
{

}
@end

@implementation CALayer (IKNImageView)

- (id)createScannerBackgroundColorBottom
{
    return nil;
}

- (id)createScannerBackgroundColorTop
{
    return nil;
}

- (id)debug
{
    return nil;
}

- (id)layerType
{
    return nil;
}

- (id)setBackgroundGray:(id)arg1 alpha:(id)arg2
{
    return nil;
}

- (id)setBackgroundRed:(id)arg1 green:(id)arg2 blue:(id)arg3 alpha:(id)arg4
{
    return nil;
}

- (id)setBorderGray:(id)arg1 alpha:(id)arg2
{
    return nil;
}

- (id)setBorderRed:(id)arg1 green:(id)arg2 blue:(id)arg3 alpha:(id)arg4
{
    return nil;
}

- (id)setScannerBackgroundColor
{
    return nil;
}
@end

@implementation CALayer (LayerExtra)

- (id)adjustPosition
{
    return nil;
}

- (id)beginMouseOperation
{
    return nil;
}

- (void)clearSelection
{

}

- (id)createNewMaskedImage:(id)arg1
{
    return nil;
}

- (id)defaultKnob
{
    return nil;
}

- (id)doDrawInContext:(id)arg1 rect:(id)arg2
{
    return nil;
}

- (id)drawInContext:(id)arg1 drawSelection:(id)arg2
{
    return nil;
}

- (id)endMouseOperation
{
    return nil;
}

- (id)handleDoubleClick:(id)arg1
{
    return nil;
}

- (id)handleMouseDown:(id)arg1
{
    return nil;
}

- (id)hasSubLayer:(id)arg1
{
    return nil;
}

- (id)ikConvertEventLocationInWindow:(id)arg1 toLayer:(id)arg2
{
    return nil;
}

- (id)ikImageBackgroundLayer
{
    return nil;
}

- (id)ikImageLayer
{
    return nil;
}

- (id)ikLayerWasAddedToSuperlayer
{
    return nil;
}

- (id)ikMouseDown:(id)arg1
{
    return nil;
}

- (id)ikRootLayer
{
    return nil;
}

- (id)ikView
{
    return nil;
}

- (id)isAnnotationLayer
{
    return nil;
}

- (id)isPasteboardLayer
{
    return nil;
}

- (id)isSelectionLayer
{
    return nil;
}

- (id)knobLayer
{
    return nil;
}

- (id)saveState:(id)arg1
{
    return nil;
}

- (id)selectLayer:(id)arg1 extendSelection:(id)arg2
{
    return nil;
}

- (id)selected
{
    return nil;
}

- (void)setAnchorPointAndKeepFrame:(id)arg1
{

}

- (void)setSelected:(id)arg1
{

}

- (void)setShouldUseOriginalLayerToDraw:(id)arg1
{

}

- (void)setSupportsUndo:(id)arg1
{

}

- (void)setup:(id)arg1
{

}

- (id)shouldUseOriginalLayerToDraw
{
    return nil;
}

- (id)startEditing:(id)arg1
{
    return nil;
}

- (id)supportsUndo
{
    return nil;
}

- (id)toolmodeWillChangeFrom:(id)arg1 to:(id)arg2
{
    return nil;
}

- (id)willBeRemovedFromSuperlayer
{
    return nil;
}
@end

@implementation CAShapeLayer (IKNImageView)

- (id)setStrokeRed:(id)arg1 green:(id)arg2 blue:(id)arg3 alpha:(id)arg4
{
    return nil;
}
@end

@implementation CIFilter (IKFilterCustomUIProvider)

- (id)provideViewForUIConfiguration:(id)arg1 excludedKeys:(id)arg2
{
    return nil;
}
@end

@implementation CIFilter (IKFilterUIAddition)

- (id)viewForUIConfiguration:(id)arg1 excludedKeys:(id)arg2
{
    return nil;
}
@end

@implementation ICCameraFile (IK)

- (id)alreadyDownloaded
{
    return nil;
}

- (id)aperture
{
    return nil;
}

- (id)callCompletionHandler:(id)arg1
{
    return nil;
}

- (id)colorSpace
{
    return nil;
}

- (id)destroyAssociatedObject
{
    return nil;
}

- (id)downloadedToPath
{
    return nil;
}

- (id)downloadedViaDoubleClick
{
    return nil;
}

- (id)downloadedViaDragAndDrop
{
    return nil;
}

- (id)extension
{
    return nil;
}

- (id)forceNextDownload
{
    return nil;
}

- (id)hasAperture
{
    return nil;
}

- (id)hasHeight
{
    return nil;
}

- (id)hasLocation
{
    return nil;
}

- (id)hasWidth
{
    return nil;
}

- (id)image
{
    return nil;
}

- (id)imageRepresentation
{
    return nil;
}

- (id)imageRepresentationType
{
    return nil;
}

- (id)imageTitle
{
    return nil;
}

- (id)imageUID
{
    return nil;
}

- (id)isLivePhoto
{
    return nil;
}

- (id)kind
{
    return nil;
}

- (id)latitude
{
    return nil;
}

- (id)locationString
{
    return nil;
}

- (id)longitude
{
    return nil;
}

- (id)maker
{
    return nil;
}

- (id)model
{
    return nil;
}

- (id)name_ext
{
    return nil;
}

- (id)prepareForDelete
{
    return nil;
}

- (id)resetDownloadedPath
{
    return nil;
}

- (id)rotateLeft
{
    return nil;
}

- (id)rotateOrientation:(id)arg1
{
    return nil;
}

- (id)rotateRight
{
    return nil;
}

- (void)setCompletionHandler:(id)arg1
{

}

- (void)setDownloadedToPath:(id)arg1
{

}

- (void)setDownloadedViaDoubleClick:(id)arg1
{

}

- (void)setDownloadedViaDragAndDrop:(id)arg1
{

}

- (void)setForceNextDownload:(id)arg1
{

}

- (void)setImage:(id)arg1
{

}

- (void)setThumbnailOrientation:(id)arg1
{

}

- (id)setupAssociatedObject
{
    return nil;
}

- (id)shutterSpeed
{
    return nil;
}

- (id)thumbnailOrientation
{
    return nil;
}

- (id)wasPreparedForDelete
{
    return nil;
}
@end

@implementation ICDevice (IKDeviceBrowserViewExtension)

- (id)children
{
    return nil;
}

- (id)deviceBusy
{
    return nil;
}

- (id)imageRepresentation
{
    return nil;
}

- (id)imageRepresentationType
{
    return nil;
}

- (id)imageTitle
{
    return nil;
}

- (id)imageUID
{
    return nil;
}

- (id)isIKCamera
{
    return nil;
}

- (id)isIKScanner
{
    return nil;
}

- (void)setDeviceBusy:(id)arg1
{

}

- (id)supportsDelete
{
    return nil;
}

- (id)supportsHEIF
{
    return nil;
}
@end

@implementation IKCameraDeviceViewHandler (ICCameraDeviceDelegate)

- (void)cameraDevice:(id)arg1 didAddItems:(id)arg2
{

}

- (void)cameraDevice:(id)arg1 didCompleteDeleteFilesWithError:(id)arg2
{

}

- (void)cameraDevice:(id)arg1 didReceiveMetadata:(id)arg2 forItem:(id)arg3 error:(id)arg4
{

}

- (void)cameraDevice:(id)arg1 didReceivePTPEvent:(id)arg2
{

}

- (void)cameraDevice:(id)arg1 didReceiveThumbnail:(CGImageRef)arg2 forItem:(id)arg3 error:(id)arg4
{

}

- (void)cameraDevice:(id)arg1 didRemoveItems:(id)arg2
{

}

- (void)cameraDevice:(id)arg1 didRenameItems:(id)arg2
{

}

- (void)cameraDeviceDidChangeCapability:(id)arg1
{

}

- (void)cameraDeviceDidEnableAccessRestriction:(id)arg1
{

}

- (void)cameraDeviceDidRemoveAccessRestriction:(id)arg1
{

}

- (id)cancelAddedItemsTimerAndFireBlock:(id)arg1
{
    return nil;
}

- (void)device:(id)arg1 didCloseSessionWithError:(id)arg2
{

}

- (void)device:(id)arg1 didEncounterError:(id)arg2
{

}

- (void)device:(id)arg1 didOpenSessionWithError:(id)arg2
{

}

- (id)device:(id)arg1 didReceiveNotification:(id)arg2
{
    return nil;
}

- (void)deviceDidBecomeReadyWithCompleteContentCatalog:(id)arg1
{

}

- (void)deviceDidChangeName:(id)arg1
{

}

- (void)deviceDidChangeSharingState:(id)arg1
{

}

- (id)deviceWillEjectOrDisconnect:(id)arg1
{
    return nil;
}

- (void)didRemoveDevice:(id)arg1
{

}

- (id)doneWithCamera
{
    return nil;
}

- (id)filePromiseProvider:(id)arg1 fileNameForType:(id)arg2
{
    return nil;
}

- (id)filePromiseProvider:(id)arg1 writePromiseToURL:(id)arg2 completionHandler:(id)arg3
{
    return nil;
}

- (id)handleCloseSessionOrDeviceRemovedWhileDownloading:(id)arg1
{
    return nil;
}

- (id)operationQueueForFilePromiseProvider:(id)arg1
{
    return nil;
}

- (id)startAddedItemsTimerWithInterval:(id)arg1 andFireBlock:(id)arg2
{
    return nil;
}

- (id)updateSelectionIndexes
{
    return nil;
}
@end

@implementation IKCameraDeviceViewHandler (NSCollectionView)

- (id)addVisibleIndexPath:(id)arg1
{
    return nil;
}

- (void)collectionView:(id)arg1 didDeselectItemsAtIndexPaths:(id)arg2
{

}

- (void)collectionView:(id)arg1 didEndDisplayingItem:(id)arg2 forRepresentedObjectAtIndexPath:(id)arg3
{

}

- (void)collectionView:(id)arg1 didSelectItemsAtIndexPaths:(id)arg2
{

}

- (void)collectionView:(id)arg1 draggingSession:(id)arg2 endedAtPoint:(NSPoint)arg3 dragOperation:(NSDragOperation)arg4
{

}

- (void)collectionView:(id)arg1 draggingSession:(id)arg2 willBeginAtPoint:(NSPoint)arg3 forItemsAtIndexPaths:(id)arg4
{

}

- (id)collectionView:(id)arg1 itemForRepresentedObjectAtIndexPath:(id)arg2
{
    return nil;
}

- (NSSize)collectionView:(id)arg1 layout:(id)arg2 sizeForItemAtIndexPath:(id)arg3
{
    return (NSSize){0};
}

- (NSInteger)collectionView:(id)arg1 numberOfItemsInSection:(NSInteger)arg2
{
    return (NSInteger){0};
}

- (id)collectionView:(id)arg1 pasteboardWriterForItemAtIndexPath:(id)arg2
{
    return nil;
}

- (void)collectionView:(id)arg1 willDisplayItem:(id)arg2 forRepresentedObjectAtIndexPath:(id)arg3
{

}

- (id)dragTypes
{
    return nil;
}

- (id)isVisible:(id)arg1
{
    return nil;
}

- (id)removeVisibleIndexPath:(id)arg1
{
    return nil;
}

- (id)updateIconView:(id)arg1 forIndex:(id)arg2
{
    return nil;
}
@end

@implementation IKCameraDeviceViewHandler (NSTableView)

- (BOOL)cameraDevice:(id)arg1 shouldGetMetadataOfItem:(id)arg2
{
    return (BOOL){0};
}

- (BOOL)cameraDevice:(id)arg1 shouldGetThumbnailOfItem:(id)arg2
{
    return (BOOL){0};
}

- (void)didDownloadFile:(id)arg1 error:(id)arg2 options:(id)arg3 contextInfo:(void *)arg4
{

}

- (void)didReceiveDownloadProgressForFile:(id)arg1 downloadedBytes:(id)arg2 maxBytes:(id)arg3
{

}

- (NSDragOperation)draggingEntered:(id)arg1
{
    return (NSDragOperation){0};
}

- (NSDragOperation)draggingUpdated:(id)arg1
{
    return (NSDragOperation){0};
}

- (NSInteger)numberOfRowsInTableView:(id)arg1
{
    return (NSInteger){0};
}

- (BOOL)performDragOperation:(id)arg1
{
    return (BOOL){0};
}

- (BOOL)selectionShouldChangeInTableView:(id)arg1
{
    return (BOOL){0};
}

- (id)shouldDownloadResource:(id)arg1
{
    return nil;
}

- (id)tableView:(id)arg1 cellClicked:(id)arg2 row:(id)arg3
{
    return nil;
}

- (id)tableView:(id)arg1 namesOfPromisedFilesDroppedAtDestination:(id)arg2 forDraggedRowsWithIndexes:(id)arg3
{
    return nil;
}

- (id)tableView:(id)arg1 objectValueForTableColumn:(id)arg2 row:(NSInteger)arg3
{
    return nil;
}

- (BOOL)tableView:(id)arg1 shouldSelectRow:(NSInteger)arg2
{
    return (BOOL){0};
}

- (BOOL)tableView:(id)arg1 shouldTrackCell:(id)arg2 forTableColumn:(id)arg3 row:(NSInteger)arg4
{
    return (BOOL){0};
}

- (void)tableView:(id)arg1 sortDescriptorsDidChange:(id)arg2
{

}

- (BOOL)tableView:(id)arg1 writeRowsWithIndexes:(id)arg2 toPasteboard:(id)arg3
{
    return (BOOL){0};
}

- (id)tableViewDoubleClicked:(id)arg1
{
    return nil;
}

- (void)tableViewSelectionDidChange:(id)arg1
{

}

- (id)updateVisibleInfo:(id)arg1
{
    return nil;
}
@end

@implementation IKDatasourceDiffResult (internal)

- (id)addAddOperationWithIndex:(id)arg1
{
    return nil;
}

- (id)addMoveOperationFrom:(id)arg1 to:(id)arg2
{
    return nil;
}

- (id)addRemoveOperationWithIndex:(id)arg1
{
    return nil;
}

- (id)allocIndexesBuffers:(id)arg1
{
    return nil;
}

- (void)setNeedToExchangeItems:(id)arg1
{

}
@end

@implementation IKHierarchicalDatasourceAdaptor (Private)

- (id)convertIndexesToParentsAndChildIndexes:(id)arg1
{
    return nil;
}

- (id)convertToCellIndexChildIndex:(id)arg1 ofParent:(id)arg2
{
    return nil;
}

- (id)currentDropOperationParent:(id)arg1 childIndex:(id)arg2 cellIndex:(id)arg3
{
    return nil;
}
@end

@implementation IKImageBrowserCell (IKImageCellForward)

- (id)forwardingTargetForSelector:(id)arg1
{
    return nil;
}
@end

@implementation IKImageBrowserView (AccessibilityAdditions)

- (NSUInteger)accessibilityArrayAttributeCount:(id)arg1
{
    return (NSUInteger){0};
}

- (id)accessibilityAttributeNames
{
    return nil;
}

- (id)accessibilityAttributeValue:(id)arg1
{
    return nil;
}

- (id)accessibilityChildren
{
    return nil;
}

- (id)accessibilityHitTest:(NSPoint)arg1
{
    return nil;
}

- (NSUInteger)accessibilityIndexOfChild:(id)arg1
{
    return (NSUInteger){0};
}

- (BOOL)accessibilityIsAttributeSettable:(id)arg1
{
    return (BOOL){0};
}

- (BOOL)accessibilityIsIgnored
{
    return (BOOL){0};
}

- (id)accessibilityItemForCell:(id)arg1 atIndex:(id)arg2
{
    return nil;
}

- (id)accessibilitySelectedChildren
{
    return nil;
}

- (void)accessibilitySetValue:(id)arg1 forAttribute:(id)arg2
{

}
@end

@implementation IKImageBrowserView (Appearance)

- (id)_adjustGridRowMargin
{
    return nil;
}

- (id)_antialiasLevelChanged
{
    return nil;
}

- (id)_backingStoreDidChange
{
    return nil;
}

- (id)_colorProfileDidChange
{
    return nil;
}

- (id)_convertColor:(id)arg1 toRed:(id)arg2 green:(id)arg3 blue:(id)arg4 alpha:(id)arg5
{
    return nil;
}

- (id)_onQCTimer
{
    return nil;
}

- (id)_setBackgroundColorWithRed:(id)arg1 green:(id)arg2 blue:(id)arg3 alpha:(id)arg4
{
    return nil;
}

- (id)_setCellsOutlineColorRed:(id)arg1 green:(id)arg2 blue:(id)arg3
{
    return nil;
}

- (id)_setDefaultTextAttributes
{
    return nil;
}

- (id)_setSelectionColorRed:(id)arg1 green:(id)arg2 blue:(id)arg3
{
    return nil;
}

- (id)_systemColorsDidChange
{
    return nil;
}

- (id)appearanceStyle
{
    return nil;
}

- (id)backgroundColor
{
    return nil;
}

- (id)backgroundComposition
{
    return nil;
}

- (id)backgroundDidChange
{
    return nil;
}

- (id)backgroundIKImage
{
    return nil;
}

- (id)backgroundIsDark
{
    return nil;
}

- (id)backgroundIsSolidColor
{
    return nil;
}

- (id)backgroundIsWhite
{
    return nil;
}

- (id)backgroundLayer
{
    return nil;
}

- (id)backgroundRequiresTextHighlight
{
    return nil;
}

- (id)cellsHaveSubtitle
{
    return nil;
}

- (id)cellsHaveTitle
{
    return nil;
}

- (id)cellsStyleMask
{
    return nil;
}

- (id)enableiOSGroupEditing
{
    return nil;
}

- (id)flavorAttributes
{
    return nil;
}

- (id)fogShader
{
    return nil;
}

- (id)foregroundLayer
{
    return nil;
}

- (id)imageBrowserFlavor
{
    return nil;
}

- (id)outlinesCells
{
    return nil;
}

- (id)selectionColor
{
    return nil;
}

- (void)setAppearanceStyle:(id)arg1
{

}

- (void)setBackgroundColor:(id)arg1
{

}

- (void)setBackgroundComposition:(id)arg1
{

}

- (void)setBackgroundImage:(id)arg1
{

}

- (void)setBackgroundImageLayout:(id)arg1
{

}

- (void)setBackgroundLayer:(id)arg1
{

}

- (void)setCellsHaveSubtitle:(id)arg1
{

}

- (void)setCellsHaveTitle:(id)arg1
{

}

- (void)setCellsOutlineColor:(id)arg1
{

}

- (void)setCellsStyleMask:(id)arg1
{

}

- (void)setEnableiOSGroupEditing:(id)arg1
{

}

- (void)setForegroundLayer:(id)arg1
{

}

- (void)setImageBrowserFlavor:(id)arg1
{

}

- (void)setOutlinesCells:(id)arg1
{

}

- (void)setSelectionColor:(id)arg1
{

}

- (void)setShadowsCells:(id)arg1
{

}

- (id)shadowsCells
{
    return nil;
}

- (id)unfocusedSelectionColor
{
    return nil;
}
@end

@implementation IKImageBrowserView (GenieEffect)

- (id)createGenieWindowForBoundingBox:(id)arg1
{
    return nil;
}

- (id)drawSelectedItemsInGenieWindow:(id)arg1 withBoundingBox:(id)arg2
{
    return nil;
}

- (id)genieEffectWithSelectionToScreenPosition:(id)arg1
{
    return nil;
}

- (id)selectionBoundingBox
{
    return nil;
}
@end

@implementation IKImageBrowserView (IKImageBrowserMagnifying)

- (id)alternateMagnifying:(id)arg1
{
    return nil;
}

- (id)magnifyer
{
    return nil;
}

- (id)redisplay
{
    return nil;
}

- (id)startMagnifying:(id)arg1
{
    return nil;
}

- (id)stopMagnifying
{
    return nil;
}

- (id)updateMagnifying:(id)arg1
{
    return nil;
}
@end

@implementation IKImageBrowserView (IKImageBrowserTasks)

- (id)__didImportIcon:(id)arg1 forCell:(id)arg2 withSource:(id)arg3
{
    return nil;
}

- (id)__didImportIcons
{
    return nil;
}

- (id)__filterSyncTask:(id)arg1 regularImportOut:(id)arg2 iconImportOut:(id)arg3
{
    return nil;
}

- (id)__parseDatasourceIfQuickLookBasedForIconFetching:(id)arg1
{
    return nil;
}

- (id)__performSynchronousIconFetching:(id)arg1 delegate:(id)arg2
{
    return nil;
}

- (id)__synchronousIconFetchingForSource:(id)arg1
{
    return nil;
}

- (id)__willImportIcons
{
    return nil;
}

- (id)_cancelSynchronousTask
{
    return nil;
}

- (id)_delayedCacheDefragmentation
{
    return nil;
}

- (id)_didStabilize
{
    return nil;
}

- (id)_enableSyncTasksForRegularImport
{
    return nil;
}

- (id)_performAsyncImportIfAny:(id)arg1 delegate:(id)arg2
{
    return nil;
}

- (id)_prepareThumbnailBuildersForCells:(id)arg1 size:(id)arg2 start:(id)arg3 quality:(id)arg4 rule:(id)arg5 arrayOut:(id)arg6
{
    return nil;
}

- (id)_sizeToImportForCell:(id)arg1
{
    return nil;
}

- (id)_taskBeginNotification:(id)arg1
{
    return nil;
}

- (id)_taskManagerEndedNotification:(id)arg1
{
    return nil;
}

- (id)_taskManagerStartedNotification:(id)arg1
{
    return nil;
}

- (id)_updateTasksCellsCopy
{
    return nil;
}

- (id)abortSchedule
{
    return nil;
}

- (id)cellsArrayForTasks
{
    return nil;
}

- (id)invalidateSyncTaskCache
{
    return nil;
}

- (id)isBusyForTaskManager
{
    return nil;
}

- (id)performSynchronousTasksIfAny
{
    return nil;
}

- (id)prepareThumbnailBuilderForCell:(id)arg1 size:(id)arg2 quality:(id)arg3
{
    return nil;
}

- (id)prepareThumbnailBuildersForCells:(id)arg1 size:(id)arg2 indexes:(id)arg3 quality:(id)arg4 rule:(id)arg5
{
    return nil;
}

- (id)registerImageBrowserTasks
{
    return nil;
}

- (id)restartTasks
{
    return nil;
}

- (id)scheduleProgress
{
    return nil;
}

- (id)shouldStartTaskNamed:(id)arg1
{
    return nil;
}

- (id)startSchedule
{
    return nil;
}

- (id)taskManager
{
    return nil;
}
@end

@implementation IKImageBrowserView (IKInlinePreview)

- (id)_inlinePreviewCellIndexForEvent:(id)arg1
{
    return nil;
}

- (id)_inlinePreviewLayerTreeDidUpdate
{
    return nil;
}

- (id)_inlinePreviewMouseEnteredInCellAtIndex:(id)arg1
{
    return nil;
}

- (id)_inlinePreviewMouseExitedFromCellAtIndex:(id)arg1
{
    return nil;
}

- (id)_itemIsAFolderAtIndex:(id)arg1
{
    return nil;
}

- (id)_itemIsAFolderWithCustomIconAtIndex:(id)arg1
{
    return nil;
}

- (id)_mouseEnteredInRolloverCellAfterDelay
{
    return nil;
}

- (id)_patchFrameForContentInset:(id)arg1
{
    return nil;
}

- (id)_refreshUserDefaultsForInlinePreview
{
    return nil;
}

- (id)acceptsPreviewPanelControl:(id)arg1
{
    return nil;
}

- (id)allowRolloverInlinePreviewForCellAtIndex:(id)arg1
{
    return nil;
}

- (id)allowsInlinePreviews
{
    return nil;
}

- (id)beginPreviewPanelControl:(id)arg1
{
    return nil;
}

- (id)canControlQuickLookPanel
{
    return nil;
}

- (id)cellIndexForInlinePreviewController:(id)arg1
{
    return nil;
}

- (id)displayRolloverInlinePreviewForCellAtIndex:(id)arg1
{
    return nil;
}

- (id)drawInlinePreview
{
    return nil;
}

- (id)endPreviewPanelControl:(id)arg1
{
    return nil;
}

- (id)hidePlayedInlinePreview
{
    return nil;
}

- (id)hideRolloverInlinePreview
{
    return nil;
}

- (id)inlinePreview:(id)arg1 contentFrameForPreviewItem:(id)arg2
{
    return nil;
}

- (id)inlinePreview:(id)arg1 didChangeToState:(id)arg2
{
    return nil;
}

- (id)inlinePreview:(id)arg1 didLoadPreviewItem:(id)arg2
{
    return nil;
}

- (id)inlinePreview:(id)arg1 expectedModeForPreviewItem:(id)arg2 flavor:(id)arg3
{
    return nil;
}

- (id)inlinePreview:(id)arg1 frameForPreviewItem:(id)arg2
{
    return nil;
}

- (id)inlinePreview:(id)arg1 rolloverFrameForPreviewItem:(id)arg2
{
    return nil;
}

- (id)inlinePreview:(id)arg1 willHidePreview:(id)arg2
{
    return nil;
}

- (id)inlinePreview:(id)arg1 willLoadPreviewItem:(id)arg2
{
    return nil;
}

- (id)inlinePreviewEnabled
{
    return nil;
}

- (id)inlinePreviewFrameForItemAtIndex:(id)arg1
{
    return nil;
}

- (id)inlinePreviewItemsForCellIndexes:(id)arg1
{
    return nil;
}

- (id)inlinePreviewModeForCellAtIndex:(id)arg1 item:(id)arg2
{
    return nil;
}

- (id)inlinePreviewMouseDown:(id)arg1
{
    return nil;
}

- (id)inlinePreviewMouseEntered:(id)arg1
{
    return nil;
}

- (id)inlinePreviewMouseExited:(id)arg1
{
    return nil;
}

- (id)inlinePreviewView
{
    return nil;
}

- (id)inlinePreviewWillLoadForItemAtIndex:(id)arg1
{
    return nil;
}

- (id)mousePositionInView
{
    return nil;
}

- (id)needsToUpdatePreviewPanelFrame:(id)arg1
{
    return nil;
}

- (id)nicestRenderingDoneAndUpdateInlinePreviewFrame:(id)arg1
{
    return nil;
}

- (id)numberOfPreviewItemsInPreviewPanel:(id)arg1
{
    return nil;
}

- (id)previewItemForCellAtIndex:(id)arg1
{
    return nil;
}

- (id)previewPanel:(id)arg1 handleEvent:(id)arg2
{
    return nil;
}

- (id)previewPanel:(id)arg1 previewItemAtIndex:(id)arg2
{
    return nil;
}

- (id)previewPanel:(id)arg1 sharedPreviewViewForPreviewItem:(id)arg2
{
    return nil;
}

- (id)previewPanel:(id)arg1 sourceFrameOnScreenForPreviewItem:(id)arg2
{
    return nil;
}

- (id)previewPanel:(id)arg1 transitionImageForPreviewItem:(id)arg2 contentRect:(id)arg3
{
    return nil;
}

- (id)removeAllInlinePreviewTrackingAreasAndStopPlaying:(id)arg1
{
    return nil;
}

- (id)selectionDidChangeForInlinePreview
{
    return nil;
}

- (void)setCanControlQuickLookPanel:(id)arg1
{

}

- (void)setInlinePreviewEnabled:(id)arg1
{

}

- (void)setSharingPreviewPanel:(id)arg1
{

}

- (id)setupInlinePreview
{
    return nil;
}

- (id)setupInlinePreviewControllers
{
    return nil;
}

- (id)sharingPreviewPanel
{
    return nil;
}

- (id)shouldBypassDrawingForCell:(id)arg1
{
    return nil;
}

- (id)shouldUseXRayFolderForItemAtIndex:(id)arg1
{
    return nil;
}

- (id)swapRolloverAndPlayedPreviewControllerIfNeededWhenUserStartsInlinePreview:(id)arg1
{
    return nil;
}

- (id)unsetupInlinePreview
{
    return nil;
}

- (id)updateInlinePreviewFrameIfNeeded
{
    return nil;
}

- (id)updateInlinePreviewTrackingAreas
{
    return nil;
}

- (id)updateQuickLookPanelWithSelection
{
    return nil;
}

- (id)visibleCellIndexForPreviewItem:(id)arg1
{
    return nil;
}
@end

@implementation IKImageBrowserView (IKToolTips)

- (id)addToolTip:(id)arg1 inRect:(id)arg2
{
    return nil;
}

- (id)installToolTips
{
    return nil;
}

- (id)removeAllToolTipsIfNeeded
{
    return nil;
}

- (id)view:(id)arg1 stringForToolTip:(NSToolTipTag)arg2 point:(NSPoint)arg3 userData:(void *)arg4
{
    return nil;
}
@end

@implementation IKImageBrowserView (IconFlavorAdditions)

- (id)disableTwoLineTitles
{
    return nil;
}

- (id)showItemInfo
{
    return nil;
}
@end

@implementation IKImageBrowserView (ImageBrowserAnimation)

- (id)animationChannelEnabled:(id)arg1
{
    return nil;
}

- (id)animationManager
{
    return nil;
}

- (id)animationValueForKey:(id)arg1 forCell:(id)arg2
{
    return nil;
}

- (id)animationsDidFinish
{
    return nil;
}

- (id)animationsMask
{
    return nil;
}

- (id)initAppearingAnimationWithItems:(id)arg1 diff:(id)arg2
{
    return nil;
}

- (id)initImportAnimationWithIndexes:(id)arg1
{
    return nil;
}

- (id)initMovingAndDisappearingAnimationWithItems:(id)arg1 diff:(id)arg2
{
    return nil;
}

- (id)isAnimating
{
    return nil;
}

- (void)setAnimationsMask:(id)arg1
{

}

- (id)shouldAnimateAppearingAndDisappearingDatasourceItems
{
    return nil;
}
@end

@implementation IKImageBrowserView (ImageBrowserDatasource)

- (id)_reloadCellDataAtIndex:(id)arg1
{
    return nil;
}

- (id)_reloadData
{
    return nil;
}

- (id)_resetiOSGroupsDimFactor
{
    return nil;
}

- (id)amountOfMemoryOfCurrentDataSource:(id)arg1
{
    return nil;
}

- (id)bumpDatasourceVersion
{
    return nil;
}

- (id)clearPresentationDatasource
{
    return nil;
}

- (id)dataSourceRespondsToRequiredMethods:(id)arg1
{
    return nil;
}

- (id)datasourceDidChange
{
    return nil;
}

- (id)datasourceVersion
{
    return nil;
}

- (id)getDataSourceArray:(id)arg1
{
    return nil;
}

- (id)gridGroupFromDictionary:(id)arg1
{
    return nil;
}

- (id)notifyCellsForChanges:(id)arg1
{
    return nil;
}

- (id)reloadAllCellsData
{
    return nil;
}

- (id)reloadCellDataAtIndex:(id)arg1
{
    return nil;
}

- (id)removeAllCells
{
    return nil;
}

- (id)setupPresentationDatasource
{
    return nil;
}

- (id)updateGroups:(id)arg1
{
    return nil;
}

- (id)updateItemList
{
    return nil;
}

- (id)updateiOSGroupMasterCells
{
    return nil;
}
@end

@implementation IKImageBrowserView (ImageBrowserDragNDropInternal)

- (id)_autoExpendiOSForDrag
{
    return nil;
}

- (id)_calculateDraggingOperationWithDrop:(id)arg1
{
    return nil;
}

- (id)_caretFrame
{
    return nil;
}

- (id)_caretIsHorizontal
{
    return nil;
}

- (id)_delayedUpdateiOSPresentationDatasource:(id)arg1
{
    return nil;
}

- (id)_dragFlockIconImageForItem:(id)arg1 componentMask:(id)arg2 frameOut:(id)arg3
{
    return nil;
}

- (id)_dragFlockIconImageForItem:(id)arg1 inFrame:(id)arg2
{
    return nil;
}

- (id)_dragFlockLabelImageForItem:(id)arg1 inFrame:(id)arg2
{
    return nil;
}

- (id)_dragFlockingImageComponentsForItem:(id)arg1 atIndex:(id)arg2
{
    return nil;
}

- (id)_draggedImageForFreeFormLayoutWithClickedPoint:(id)arg1 hotPoint:(id)arg2
{
    return nil;
}

- (id)_draggedImageWithFBOWithIndexes:(id)arg1 inRect:(id)arg2
{
    return nil;
}

- (id)_draggingFrameForDraggingItem:(id)arg1 componentMask:(id)arg2 image:(id)arg3
{
    return nil;
}

- (id)_drawItemTitlesForDragImage:(id)arg1
{
    return nil;
}

- (id)_drawItemsForDragImage:(id)arg1
{
    return nil;
}

- (id)_hideiOSDraggedItem:(id)arg1
{
    return nil;
}

- (id)_highlightiOSItemAtIndex:(id)arg1
{
    return nil;
}

- (id)_setiOSHighlightedGroupIndex:(id)arg1
{
    return nil;
}

- (id)_setiOSItemAtIndex:(id)arg1 highlighted:(id)arg2
{
    return nil;
}

- (id)_unhighlightiOSItemAtIndex:(id)arg1
{
    return nil;
}

- (id)_updateDraggingItemsForDrag:(id)arg1
{
    return nil;
}

- (id)_updateIndexAndDropOperationWithDrop:(id)arg1
{
    return nil;
}

- (id)_updateiOSGroupsRangeByMovingItemFromIndex:(id)arg1 toIndex:(id)arg2
{
    return nil;
}

- (id)_waitForPendingiOSGroupAnimations
{
    return nil;
}

- (id)computeRealDropIndexFromIndex:(id)arg1 takingInAccountHiddenItemsIndexes:(id)arg2
{
    return nil;
}

- (void)concludeDragOperation:(id)arg1
{

}

- (id)copyDataToPasteboard:(id)arg1 indexes:(id)arg2
{
    return nil;
}

- (id)dragStartPoint
{
    return nil;
}

- (id)draggedImage
{
    return nil;
}

- (void)draggedImage:(id)arg1 endedAt:(NSPoint)arg2 operation:(NSDragOperation)arg3
{

}

- (id)draggedImageWithEvent:(id)arg1 countBadge:(id)arg2 hotPoint:(id)arg3
{
    return nil;
}

- (id)draggedItem
{
    return nil;
}

- (id)draggingDestinationDelegate
{
    return nil;
}

- (void)draggingEnded:(id)arg1
{

}

- (NSDragOperation)draggingEntered:(id)arg1
{
    return (NSDragOperation){0};
}

- (void)draggingExited:(id)arg1
{

}

- (NSDragOperation)draggingUpdated:(id)arg1
{
    return (NSDragOperation){0};
}

- (id)dropGroupIndex
{
    return nil;
}

- (id)dropGroupOperation
{
    return nil;
}

- (id)dropIndex:(id)arg1 dropOp:(id)arg2 groupIndex:(id)arg3 groupOp:(id)arg4 appendAtEndOfGroup:(id)arg5
{
    return nil;
}

- (id)dropOperation
{
    return nil;
}

- (id)getCountBadgeForCount:(id)arg1
{
    return nil;
}

- (id)groupRangeAtLocationOfDroppedItem
{
    return nil;
}

- (id)indexOfDraggedItem
{
    return nil;
}

- (id)namesOfPromisedFilesDroppedAtDestination:(id)arg1
{
    return nil;
}

- (BOOL)performDragOperation:(id)arg1
{
    return (BOOL){0};
}

- (BOOL)prepareForDragOperation:(id)arg1
{
    return (BOOL){0};
}

- (void)setDragDestinationDelegate:(id)arg1
{

}

- (void)setDraggingDestinationDelegate:(id)arg1
{

}

- (id)setDropGroupIndex:(id)arg1 dropGroupOperation:(id)arg2
{
    return nil;
}

- (id)setDropGroupIndex:(id)arg1 dropGroupOperation:(id)arg2 appendAtEndOfGroup:(id)arg3
{
    return nil;
}

- (id)setDropIndex:(id)arg1 dropOperation:(id)arg2
{
    return nil;
}

- (void)setIsDraggingOver:(id)arg1
{

}

- (void)setReordering:(id)arg1
{

}

- (id)startDragNDropWithEvent:(id)arg1
{
    return nil;
}

- (id)startDragNDropWithEvent:(id)arg1 itemIndexes:(id)arg2
{
    return nil;
}

- (id)startiOSGroupEditing
{
    return nil;
}

- (id)startiOSGroupEditingIfNeeded
{
    return nil;
}

- (id)stopiOSGroupEditingIfNeeded
{
    return nil;
}

- (void)updateDraggingItemsForDrag:(id)arg1
{

}

- (id)updateiOSGroupEditionWithDrag:(id)arg1 delayed:(id)arg2
{
    return nil;
}

- (id)updateiOSGroupOpenStateWithDrag:(id)arg1
{
    return nil;
}
@end

@implementation IKImageBrowserView (ImageBrowserDrawing)

- (id)_checkForVisibleCellIndexesChange
{
    return nil;
}

- (id)_drawCALayer:(id)arg1 forceUpdateRect:(id)arg2
{
    return nil;
}

- (id)_drawDebugRange:(id)arg1 withOffset:(id)arg2
{
    return nil;
}

- (id)_drawQCBackground
{
    return nil;
}

- (id)_drawRect:(id)arg1
{
    return nil;
}

- (id)_imageFromGLForRect:(id)arg1
{
    return nil;
}

- (id)_imageInRect:(id)arg1 withContext:(id)arg2
{
    return nil;
}

- (id)_postCleanDegradedRendering
{
    return nil;
}

- (id)_progressBarRect
{
    return nil;
}

- (id)_sidebarBottomColor:(id)arg1 topColor:(id)arg2
{
    return nil;
}

- (id)_tileBackgroundImageInRect:(id)arg1
{
    return nil;
}

- (id)caNeedsDisplay
{
    return nil;
}

- (id)cellWillDrawPlaceHolder:(id)arg1
{
    return nil;
}

- (id)drawBackground:(id)arg1
{
    return nil;
}

- (id)drawBackgroundOverhangInRect:(id)arg1
{
    return nil;
}

- (id)drawDebugGrid
{
    return nil;
}

- (id)drawDebugSchedulePriorityRanges
{
    return nil;
}

- (id)drawDragBackground
{
    return nil;
}

- (id)drawDragOverlays
{
    return nil;
}

- (void)drawLayer:(id)arg1 inContext:(CGContextRef)arg2
{

}

- (id)drawLayer:(id)arg1 inRect:(id)arg2 performUpdateRect:(id)arg3
{
    return nil;
}

- (id)drawLoadingFrame
{
    return nil;
}

- (id)drawOverlays
{
    return nil;
}

- (void)drawRect:(NSRect)arg1
{

}

- (id)drawSelectionAndOverlays
{
    return nil;
}

- (id)drawSelectionFrame:(id)arg1
{
    return nil;
}

- (id)drawVisibleCells:(id)arg1
{
    return nil;
}

- (id)drawWithCurrentRendererInRect:(id)arg1
{
    return nil;
}

- (id)imageForRect:(id)arg1
{
    return nil;
}

- (id)performRenderTimeLayoutModifiers:(id)arg1
{
    return nil;
}

- (id)refreshLoadingProgressBar
{
    return nil;
}

- (id)renderLevel
{
    return nil;
}

- (id)scrollScreenBy:(id)arg1
{
    return nil;
}

- (void)setNextFrameTime:(id)arg1
{

}

- (void)setRenderLevel:(id)arg1
{

}

- (id)viewportRect
{
    return nil;
}
@end

@implementation IKImageBrowserView (ImageBrowserEvents)

- (id)_browserCellFromEvent:(id)arg1
{
    return nil;
}

- (id)_endScrollingInGroup:(id)arg1
{
    return nil;
}

- (id)_internalNextTypeSelectMatchFromIndex:(id)arg1 toIndex:(id)arg2 forString:(id)arg3
{
    return nil;
}

- (id)_performTypeSelect:(id)arg1
{
    return nil;
}

- (id)_rightMouseDown:(id)arg1
{
    return nil;
}

- (id)_scrollPageInDirection:(id)arg1
{
    return nil;
}

- (id)_setScrollingGroup:(id)arg1
{
    return nil;
}

- (id)_startDelayedTitleEditingWithEvent
{
    return nil;
}

- (id)_typeSelectEndCurrentSearch
{
    return nil;
}

- (id)_typeSelectInterpretKeyEvent:(id)arg1
{
    return nil;
}

- (id)_typeSelectUndoLastSearch
{
    return nil;
}

- (BOOL)acceptsFirstMouse:(id)arg1
{
    return (BOOL){0};
}

- (id)acceptsFirstResponder
{
    return nil;
}

- (id)arrowKeyDown:(id)arg1 withModifier:(id)arg2
{
    return nil;
}

- (BOOL)becomeFirstResponder
{
    return (BOOL){0};
}

- (void)beginGestureWithEvent:(id)arg1
{

}

- (id)defaultDoubleClickAction:(id)arg1
{
    return nil;
}

- (id)enableMagnification
{
    return nil;
}

- (void)endGestureWithEvent:(id)arg1
{

}

- (id)forwardEvent:(id)arg1 to:(id)arg2
{
    return nil;
}

- (id)handleKeyInput:(id)arg1 character:(id)arg2
{
    return nil;
}

- (id)hasFocus
{
    return nil;
}

- (void)keyDown:(id)arg1
{

}

- (void)magnifyWithEvent:(id)arg1
{

}

- (void)mouseDown:(id)arg1
{

}

- (void)mouseDragged:(id)arg1
{

}

- (void)mouseEntered:(id)arg1
{

}

- (void)mouseExited:(id)arg1
{

}

- (void)mouseMoved:(id)arg1
{

}

- (void)mouseUp:(id)arg1
{

}

- (id)nextIndexInGridLayoutWithDirectionKey:(id)arg1 currentIndex:(id)arg2
{
    return nil;
}

- (void)pageDown:(id)arg1
{

}

- (void)pageUp:(id)arg1
{

}

- (id)removeTrackingAreas
{
    return nil;
}

- (BOOL)resignFirstResponder
{
    return (BOOL){0};
}

- (void)rightMouseDown:(id)arg1
{

}

- (void)scrollWheel:(id)arg1
{

}

- (id)scrollWheelMultiplier
{
    return nil;
}

- (id)setClickableArea:(id)arg1 target:(id)arg2 selector:(id)arg3 info:(id)arg4
{
    return nil;
}

- (void)setEnableMagnification:(id)arg1
{

}

- (void)setMouseTracker:(id)arg1
{

}

- (BOOL)shouldDelayWindowOrderingForEvent:(id)arg1
{
    return (BOOL){0};
}

- (id)trackMouseEvent:(id)arg1
{
    return nil;
}

- (void)updateTrackingAreas
{

}
@end

@implementation IKImageBrowserView (ImageBrowserIPhotoImport)

- (id)importAllToIphoto
{
    return nil;
}

- (id)importFilesToIPhoto:(id)arg1
{
    return nil;
}

- (id)importSelectionToIPhoto
{
    return nil;
}

- (id)threadedExecScript:(id)arg1
{
    return nil;
}
@end

@implementation IKImageBrowserView (ImageBrowserImport)

- (id)__didComputeThumbnail:(id)arg1
{
    return nil;
}

- (id)_cellIndexesToImport
{
    return nil;
}

- (id)_cellsToImport:(id)arg1
{
    return nil;
}

- (id)_didComputeThumbnail:(id)arg1
{
    return nil;
}

- (id)_didImportAsynchronousThumbnail:(id)arg1
{
    return nil;
}

- (id)_didImportCellsAtIndexes:(id)arg1
{
    return nil;
}

- (id)_didImportThumbnail:(id)arg1
{
    return nil;
}

- (id)_didPrefetchAsynchronousThumbnail:(id)arg1
{
    return nil;
}

- (id)_importThumbnails:(id)arg1 state:(id)arg2
{
    return nil;
}

- (id)_indexesToPrefetch
{
    return nil;
}

- (id)_needImport:(id)arg1 forCellSize:(id)arg2
{
    return nil;
}

- (id)_needToPrefetchCell:(id)arg1
{
    return nil;
}

- (id)_prefetchThumbnails:(id)arg1 state:(id)arg2
{
    return nil;
}

- (id)_shouldProcessLongTasks
{
    return nil;
}

- (id)_taskRedisplay
{
    return nil;
}

- (id)abortImportVisibleCells
{
    return nil;
}

- (id)abortScrollPrefetchTask
{
    return nil;
}

- (id)abortZoomPrefetchTask
{
    return nil;
}

- (id)didImportCell:(id)arg1 thumbnail:(id)arg2
{
    return nil;
}

- (id)directImportMode
{
    return nil;
}

- (id)fetchThumbnailForCell:(id)arg1
{
    return nil;
}

- (id)iconImportDisabled
{
    return nil;
}

- (id)importCellSynchronously:(id)arg1
{
    return nil;
}

- (id)importVisibleCellsPriority
{
    return nil;
}

- (id)importVisibleCellsProgress
{
    return nil;
}

- (id)scrollPrefetchTaskDelay
{
    return nil;
}

- (id)scrollPrefetchTaskProgress
{
    return nil;
}

- (void)setDirectImportMode:(id)arg1
{

}

- (void)setIconImportDisabled:(id)arg1
{

}

- (id)startImportVisibleCells
{
    return nil;
}

- (id)startScrollPrefetchTask
{
    return nil;
}

- (id)startZoomPrefetchTask
{
    return nil;
}

- (id)zoomPrefetchTaskDelay
{
    return nil;
}

- (id)zoomPrefetchTaskProgress
{
    return nil;
}
@end

@implementation IKImageBrowserView (ImageBrowserLayout)

- (id)__ikVisibleRect
{
    return nil;
}

- (id)_additionalOffsetForContentInset
{
    return nil;
}

- (id)_adjustFreeFormLayout
{
    return nil;
}

- (id)_beginLayoutTransaction
{
    return nil;
}

- (id)_commitLayoutTransaction
{
    return nil;
}

- (id)_currentViewOffset
{
    return nil;
}

- (id)_ikVisibleRect
{
    return nil;
}

- (id)_ikVisibleRectMinusContentInset
{
    return nil;
}

- (id)_updateFreeFormLayoutAtIndexes:(id)arg1 ignoreZValues:(id)arg2
{
    return nil;
}

- (id)_updateGridSize
{
    return nil;
}

- (id)adjustFreeFormScaleFactor
{
    return nil;
}

- (id)beginTransaction:(id)arg1
{
    return nil;
}

- (id)cellAnchorDocumentPointAtIndex:(id)arg1
{
    return nil;
}

- (id)cellAnchorPointAtIndex:(id)arg1
{
    return nil;
}

- (id)cellAnchoredFrameAtIndex:(id)arg1 forItem:(id)arg2
{
    return nil;
}

- (id)cellDocumentRectAtIndex:(id)arg1
{
    return nil;
}

- (id)cellFrameAtIndex:(id)arg1
{
    return nil;
}

- (id)cellImageDocumentRectAtIndex:(id)arg1
{
    return nil;
}

- (id)cellIndexAtDocumentPosition:(id)arg1
{
    return nil;
}

- (id)cellMaximumSizeForCurrentBounds
{
    return nil;
}

- (id)columnIndexesInRect:(NSRect)arg1
{
    return nil;
}

- (id)commitTransaction
{
    return nil;
}

- (id)contentResizingMask
{
    return nil;
}

- (id)convertPointFromDocumentToView:(id)arg1
{
    return nil;
}

- (id)convertPointFromViewToDocument:(id)arg1
{
    return nil;
}

- (id)convertPointFromWindowToView:(id)arg1
{
    return nil;
}

- (id)convertRectFromDocumentToView:(id)arg1
{
    return nil;
}

- (id)convertRectFromViewToDocument:(id)arg1
{
    return nil;
}

- (id)defaultHeightOfInfoSpaceWithCurrentViewOptions
{
    return nil;
}

- (id)documentVisibleRect
{
    return nil;
}

- (id)frameDidChange:(id)arg1
{
    return nil;
}

- (id)freeFormLayoutDidChange
{
    return nil;
}

- (id)freeFormLayoutMode
{
    return nil;
}

- (id)freeFormLayoutMoveWithDrop:(id)arg1
{
    return nil;
}

- (id)freeFormScaleFactor
{
    return nil;
}

- (id)gridVisibleRect
{
    return nil;
}

- (id)imageFrameAtIndex:(id)arg1
{
    return nil;
}

- (id)imageIndexesInDocumentRect:(id)arg1
{
    return nil;
}

- (id)imageIndexesInDocumentRect:(id)arg1 includesCollapsedIndexes:(id)arg2
{
    return nil;
}

- (id)indexOfItemAtPoint:(id)arg1
{
    return nil;
}

- (id)indexesMinusOverflowIndexes:(id)arg1
{
    return nil;
}

- (id)indexesPlusCollapsedIndexesAtIndexes:(id)arg1
{
    return nil;
}

- (id)intercellSpacing
{
    return nil;
}

- (id)invalidateCellsLayout
{
    return nil;
}

- (id)invalidateCellsLayoutAtIndexes:(id)arg1
{
    return nil;
}

- (id)isCellPartiallyObscuredAtIndex:(id)arg1 onlyTestImage:(id)arg2
{
    return nil;
}

- (id)itemFrameAtIndex:(id)arg1
{
    return nil;
}

- (id)layoutOfCellAtIndexIsValid:(id)arg1
{
    return nil;
}

- (id)layoutOfCellIndexesDidChange:(id)arg1
{
    return nil;
}

- (id)locationInView:(id)arg1 hitCellAtIndex:(id)arg2
{
    return nil;
}

- (id)nextIndexInFreeFormLayoutWithDirectionKey:(id)arg1 currentIndex:(id)arg2
{
    return nil;
}

- (id)numberOfColumns
{
    return nil;
}

- (id)numberOfRows
{
    return nil;
}

- (NSRect)rectOfColumn:(NSInteger)arg1
{
    return (NSRect){0};
}

- (NSRect)rectOfRow:(NSInteger)arg1
{
    return (NSRect){0};
}

- (id)rolloverFrameForCellAtIndex:(id)arg1
{
    return nil;
}

- (id)rowIndexesInRect:(id)arg1
{
    return nil;
}

- (id)scrollViewFrameDidChange:(id)arg1
{
    return nil;
}

- (void)setContentResizingMask:(id)arg1
{

}

- (void)setFrame:(id)arg1
{

}

- (void)setFreeFormLayoutMode:(id)arg1
{

}

- (id)setFreeFormLayoutMode:(id)arg1 animate:(id)arg2
{
    return nil;
}

- (void)setIntercellSpacing:(id)arg1
{

}

- (void)sizeToFit
{

}

- (id)sizeToFitWithGroups:(id)arg1 columns:(id)arg2
{
    return nil;
}

- (id)spaceOutCellsForDropShouldReset:(id)arg1 animate:(id)arg2
{
    return nil;
}

- (id)translateAllCellsBy:(id)arg1
{
    return nil;
}

- (id)updateFreeFormLayout
{
    return nil;
}

- (id)updateFreeFormLayoutAtIndexes:(id)arg1
{
    return nil;
}

- (id)updateGridContent
{
    return nil;
}

- (id)updateGridContentAtIndexes:(id)arg1
{
    return nil;
}

- (id)updateLayout
{
    return nil;
}

- (id)updateLayoutAtIndexes:(id)arg1
{
    return nil;
}

- (id)updateLayoutOfCells
{
    return nil;
}

- (id)updateLayoutOfCellsAtIndexes:(id)arg1
{
    return nil;
}

- (id)validateCellLayoutAtIndex:(id)arg1
{
    return nil;
}

- (id)validateCellsLayoutAtIndexes:(id)arg1
{
    return nil;
}

- (id)viewOffsetForCurrentClipRect
{
    return nil;
}

- (id)visibleCellIndexes
{
    return nil;
}

- (id)visibleCellIndexesDidChange
{
    return nil;
}

- (id)visibleItemIndexes
{
    return nil;
}
@end

@implementation IKImageBrowserView (ImageBrowserMisc)

- (id)runFullPerformanceTest
{
    return nil;
}

- (id)secondsSinceTop:(id)arg1
{
    return nil;
}

- (id)testAnimationPerformances
{
    return nil;
}

- (id)testImageCountPerformances
{
    return nil;
}

- (id)testScrollPerformances
{
    return nil;
}

- (id)testScrollPerformancesWithDelta:(id)arg1 withCount:(id)arg2
{
    return nil;
}

- (id)testZoomPerformances
{
    return nil;
}

- (id)top
{
    return nil;
}
@end

@implementation IKImageBrowserView (ImageBrowserNicestRenderLoop)

- (id)_initNicestRenderingCellOrderedIndexes
{
    return nil;
}

- (id)_nicestRederingCellIndexAtIndex:(id)arg1
{
    return nil;
}

- (id)abortNicestRendering
{
    return nil;
}

- (id)nicestRenderingDelay
{
    return nil;
}

- (id)nicestRenderingEnabled
{
    return nil;
}

- (id)nicestRenderingExpendStep
{
    return nil;
}

- (id)nicestRenderingIsDone
{
    return nil;
}

- (id)nicestRenderingLoop
{
    return nil;
}

- (id)nicestRenderingPrepareExpendStep:(id)arg1
{
    return nil;
}

- (id)nicestRenderingProgress
{
    return nil;
}

- (void)setEnableNicestRendering:(id)arg1
{

}

- (id)startNicestRendering
{
    return nil;
}
@end

@implementation IKImageBrowserView (ImageBrowserScrolling)

- (id)_adjustDocumentOffset:(id)arg1
{
    return nil;
}

- (id)_adjustDocumentSize
{
    return nil;
}

- (id)_adjustLineScroll
{
    return nil;
}

- (id)_adjustLineScrollWithSnap:(id)arg1
{
    return nil;
}

- (id)_adjustScroller:(id)arg1 withDocumentLength:(id)arg2 withViewLength:(id)arg3 offset:(id)arg4
{
    return nil;
}

- (id)_currentScrollingAnimation
{
    return nil;
}

- (id)_focusImageAtIndex:(id)arg1 progressive:(id)arg2
{
    return nil;
}

- (id)_offsetToFocusItemAtIndex:(id)arg1
{
    return nil;
}

- (id)_scrollIndexToVisible:(id)arg1
{
    return nil;
}

- (id)_stopAutoscroll
{
    return nil;
}

- (id)_updateCurrentAutoscrollInGroupValueWithPoint:(id)arg1
{
    return nil;
}

- (id)adjustDocumentSize
{
    return nil;
}

- (id)adjustScrollOffsetFromClipView:(id)arg1
{
    return nil;
}

- (id)adjustScroller
{
    return nil;
}

- (BOOL)autoscroll:(id)arg1
{
    return (BOOL){0};
}

- (id)autoscrollCallBack
{
    return nil;
}

- (id)autoscrollCallBackInGroup
{
    return nil;
}

- (id)autoscrollInGroup:(id)arg1 withLocalPoint:(id)arg2
{
    return nil;
}

- (id)autoscrollWithLocalPoint:(id)arg1 andSensitiveMargin:(id)arg2
{
    return nil;
}

- (id)browserDidScroll
{
    return nil;
}

- (id)delayedUpdateTrackingAreasAfterScrolling
{
    return nil;
}

- (id)focusImageAtIndex:(id)arg1
{
    return nil;
}

- (id)focusImageAtIndex:(id)arg1 progressive:(id)arg2
{
    return nil;
}

- (id)focusImageAtIndexAndRedisplay:(id)arg1
{
    return nil;
}

- (id)focusImageAtIndexAndRedisplayIfNeeded:(id)arg1
{
    return nil;
}

- (id)focusedImageIndex
{
    return nil;
}

- (id)initProgressiveFocus:(id)arg1
{
    return nil;
}

- (id)installScrollValuesToScrollView:(id)arg1
{
    return nil;
}

- (id)invalidateFocusedIndex
{
    return nil;
}

- (id)mostCenteredImageIndex
{
    return nil;
}

- (id)scrollBy:(id)arg1
{
    return nil;
}

- (id)scrollIndexToVisible:(id)arg1
{
    return nil;
}

- (BOOL)scrollRectToVisible:(NSRect)arg1
{
    return (BOOL){0};
}

- (id)scrollStepInDirection:(id)arg1
{
    return nil;
}

- (id)scrollTo:(id)arg1
{
    return nil;
}

- (id)scrollToNormalizedValue:(id)arg1
{
    return nil;
}

- (id)scrollerDidChange:(id)arg1
{
    return nil;
}

- (id)startAutoscroll
{
    return nil;
}

- (id)stopAutoscroll
{
    return nil;
}

- (id)stopAutoscrollInGroup
{
    return nil;
}

- (id)validateFocusedIndex
{
    return nil;
}
@end

@implementation IKImageBrowserView (ImageBrowserSelection)

- (id)_currentSelectionFrame
{
    return nil;
}

- (id)_nextSelectionIndexesWithIndexesInRect:(id)arg1 withModifier:(id)arg2
{
    return nil;
}

- (id)_selectItem:(id)arg1 atIndex:(id)arg2
{
    return nil;
}

- (id)_selectItems:(id)arg1 inIndexSet:(id)arg2
{
    return nil;
}

- (id)_selectItemsInRange:(id)arg1 selected:(id)arg2
{
    return nil;
}

- (id)_selectionDidChange:(id)arg1
{
    return nil;
}

- (id)_selectionWillChange:(id)arg1
{
    return nil;
}

- (id)_setSelectionIndexes:(id)arg1 byExtendingSelection:(id)arg2 notifyObservers:(id)arg3
{
    return nil;
}

- (id)allowsEmptySelection
{
    return nil;
}

- (id)allowsTypeSelect
{
    return nil;
}

- (id)deleteSelection
{
    return nil;
}

- (id)endSelectionProcess:(id)arg1
{
    return nil;
}

- (id)getCurrentSelectionFrame
{
    return nil;
}

- (id)graphicalSelectionFrame
{
    return nil;
}

- (id)invalidateLastSelectedIndex
{
    return nil;
}

- (id)isItemSelectedAtIndex:(id)arg1
{
    return nil;
}

- (id)isSelecting
{
    return nil;
}

- (id)rememberForPreviousSelectedItem
{
    return nil;
}

- (id)resetSelectionIndexes
{
    return nil;
}

- (id)selectAllItems
{
    return nil;
}

- (id)selectItem:(id)arg1 atIndex:(id)arg2
{
    return nil;
}

- (id)selectItemsInRange:(id)arg1
{
    return nil;
}

- (id)selectionDidChange
{
    return nil;
}

- (id)selectionWillChange
{
    return nil;
}

- (void)setAllowsEmptySelection:(id)arg1
{

}

- (void)setSelectedItemsHidden:(id)arg1
{

}

- (void)setSelectedItemsReordering:(id)arg1
{

}

- (id)setSelectionIndexes:(id)arg1 byExtendingSelection:(id)arg2
{
    return nil;
}

- (id)startSelectionProcess:(id)arg1
{
    return nil;
}

- (id)unselectAllItems
{
    return nil;
}

- (id)unselectItemsInRange:(id)arg1
{
    return nil;
}

- (id)updateSelectionListFromSelectionFrame
{
    return nil;
}

- (id)updateSelectionListWithNewSelectionIndexes:(id)arg1 withModifier:(id)arg2
{
    return nil;
}

- (id)updateSelectionProcess:(id)arg1
{
    return nil;
}
@end

@implementation IKImageBrowserView (ImageBrowserSlideShow)

- (id)_buildSlideShowIndexesArray
{
    return nil;
}

- (id)_slideShowItemAtIndex:(id)arg1
{
    return nil;
}

- (id)_slideShowItemValidAtIndex:(id)arg1
{
    return nil;
}

- (id)canExportSlideshowItemAtIndex:(id)arg1 toApplication:(id)arg2
{
    return nil;
}

- (id)canStartSlideShow
{
    return nil;
}

- (id)numberOfSlideshowItems
{
    return nil;
}

- (id)slideshowDidStop
{
    return nil;
}

- (id)slideshowItemAtIndex:(id)arg1
{
    return nil;
}

- (id)startSlideShow:(id)arg1
{
    return nil;
}
@end

@implementation IKImageBrowserView (RenderingContext)

- (id)_IKOpenGLContextMayDie
{
    return nil;
}

- (id)__copyGLToCurrentFocusedView
{
    return nil;
}

- (id)__ikSetupGLContext:(id)arg1
{
    return nil;
}

- (id)_assertContextIsInstalledAsCurrentContext
{
    return nil;
}

- (id)_deleteContextIfAny
{
    return nil;
}

- (id)_emptyGLCaches
{
    return nil;
}

- (id)_ikLayerBackedOpenGLContext
{
    return nil;
}

- (id)_ikSetOpenGLContext:(id)arg1
{
    return nil;
}

- (id)_invalidateGStatesForTree
{
    return nil;
}

- (id)_openGLContextDidChange
{
    return nil;
}

- (id)_scaleFactorDidChange:(id)arg1
{
    return nil;
}

- (id)_setLayerBackedOpenGLContext:(id)arg1
{
    return nil;
}

- (id)_surfaceNeedsUpdate:(id)arg1
{
    return nil;
}

- (id)_willCloseWindow:(id)arg1
{
    return nil;
}

- (id)autoEnableSubpixelAntialiasing
{
    return nil;
}

- (id)cgRenderer
{
    return nil;
}

- (void)clearGLContext
{

}

- (id)flushGLContext
{
    return nil;
}

- (id)glRenderer
{
    return nil;
}

- (id)glRendererEnabled
{
    return nil;
}

- (id)ikSetNeedsDisplayInRect:(id)arg1
{
    return nil;
}

- (id)initRenderingContext
{
    return nil;
}

- (id)installCGOverlay:(id)arg1
{
    return nil;
}

- (id)isOpaque
{
    return nil;
}

- (BOOL)lockFocusIfCanDraw
{
    return (BOOL){0};
}

- (id)openGLContext
{
    return nil;
}

- (id)openGLContextCreateIfNeeded:(id)arg1
{
    return nil;
}

- (id)openGLContextForPixelFormat:(id)arg1
{
    return nil;
}

- (id)openglSupportsRenderingInBounds:(id)arg1
{
    return nil;
}

- (id)pixelFormat
{
    return nil;
}

- (void)prepareOpenGL
{

}

- (id)releaseRenderingContext
{
    return nil;
}

- (void)removeFromSuperview
{

}

- (id)renderer
{
    return nil;
}

- (void)renewGState
{

}

- (id)resetToDefaultRenderer
{
    return nil;
}

- (void)reshape
{

}

- (void)setGLRendererEnabled:(id)arg1
{

}

- (void)setNeedsDisplayInRect:(NSRect)arg1
{

}

- (void)setOpenGLContext:(id)arg1
{

}

- (void)setPixelFormat:(id)arg1
{

}

- (void)setRenderer:(id)arg1
{

}

- (void)setUpdatesCGSurfaceOnDrawRect:(id)arg1
{

}

- (void)setWantsLayer:(id)arg1
{

}

- (id)superviewIsAClipView
{
    return nil;
}

- (id)supportGLRenderer
{
    return nil;
}

- (id)synchronizeBackBuffer
{
    return nil;
}

- (id)synchronizeBackBufferIfNeeded
{
    return nil;
}

- (void)update
{

}

- (id)updatesCGSurfaceOnDrawRect
{
    return nil;
}

- (void)viewDidChangeBackingProperties
{

}
@end

@implementation IKImageBrowserView (bindings)

- (void)bind:(id)arg1 toObject:(id)arg2 withKeyPath:(id)arg3 options:(id)arg4
{

}

- (id)exposedBindings
{
    return nil;
}

- (void)observeValueForKeyPath:(id)arg1 ofObject:(id)arg2 change:(id)arg3 context:(void *)arg4
{

}

- (void)unbind:(id)arg1
{

}

- (Class)valueClassForBinding:(id)arg1
{
    return nil;
}
@end

@implementation IKImageBrowserView (cache)

- (id)_freeCacheStepWithVisibleIndexes:(id)arg1 range:(id)arg2 progress:(id)arg3
{
    return nil;
}

- (id)_neighbourhoodIndexesWithCacheSize:(id)arg1 cellSize:(id)arg2
{
    return nil;
}

- (id)abortFreeTemporaryCache
{
    return nil;
}

- (id)freeTemporaryCacheProgress
{
    return nil;
}

- (id)startFreeTemporaryCache
{
    return nil;
}
@end

@implementation IKImageBrowserView (grouping)

- (id)_animationForGroupedItems:(id)arg1 expand:(id)arg2
{
    return nil;
}

- (id)_expandButtonClicked:(id)arg1
{
    return nil;
}

- (id)_groupIsSelected:(id)arg1
{
    return nil;
}

- (id)_iOSGroupDidCollapse
{
    return nil;
}

- (id)_iOSGroupTitle:(id)arg1
{
    return nil;
}

- (id)_iOSGroupTitleAttributes
{
    return nil;
}

- (id)_iOSGroupTitleFrame:(id)arg1
{
    return nil;
}

- (id)_indexesToDimForGroup:(id)arg1
{
    return nil;
}

- (id)_rectOfGroup:(id)arg1
{
    return nil;
}

- (id)_rectOfGroupHeader:(id)arg1
{
    return nil;
}

- (id)_rectOfGroupTail:(id)arg1
{
    return nil;
}

- (id)_toggleGroup:(id)arg1 expand:(id)arg2 animates:(id)arg3
{
    return nil;
}

- (id)cellAtIndexIsCollapsed:(id)arg1
{
    return nil;
}

- (id)collapseAllGroups
{
    return nil;
}

- (id)collapseGroup:(id)arg1
{
    return nil;
}

- (id)collapseGroup:(id)arg1 preserveGroupLocationInView:(id)arg2
{
    return nil;
}

- (id)collapseGroupAtIndex:(id)arg1
{
    return nil;
}

- (id)drawBezelGroup:(id)arg1
{
    return nil;
}

- (id)drawBezelGroupOverlay:(id)arg1
{
    return nil;
}

- (id)drawBookletGroupOverlay:(id)arg1
{
    return nil;
}

- (id)drawDisclosureGroupHeader:(id)arg1 inRect:(id)arg2
{
    return nil;
}

- (id)drawDisclosureGroupTail:(id)arg1 inRect:(id)arg2
{
    return nil;
}

- (id)drawGroupsBackground
{
    return nil;
}

- (id)drawGroupsOverlays
{
    return nil;
}

- (id)drawIMGPreviewGroupHeader:(id)arg1 inRect:(id)arg2 distance:(id)arg3
{
    return nil;
}

- (id)drawIMGPreviewGroupTail:(id)arg1 inRect:(id)arg2
{
    return nil;
}

- (id)drawTagGroupHeader:(id)arg1 inRect:(id)arg2
{
    return nil;
}

- (id)drawTagGroupTail:(id)arg1 inRect:(id)arg2
{
    return nil;
}

- (id)expandAllGroups
{
    return nil;
}

- (id)expandGroup:(id)arg1
{
    return nil;
}

- (id)expandGroupAtIndex:(id)arg1
{
    return nil;
}

- (id)getBezelGroup:(id)arg1 points:(id)arg2
{
    return nil;
}

- (id)groupAtCellIndex:(id)arg1
{
    return nil;
}

- (id)groupAtIndex:(id)arg1
{
    return nil;
}

- (id)groupAtViewLocation:(id)arg1 clickableArea:(id)arg2
{
    return nil;
}

- (id)groupIndexAtCellIndex:(id)arg1
{
    return nil;
}

- (id)groupIndexAtViewLocation:(id)arg1 clickableArea:(id)arg2
{
    return nil;
}

- (id)indexOfGridGroup:(id)arg1
{
    return nil;
}

- (id)isGroupExpandedAtIndex:(id)arg1
{
    return nil;
}

- (id)rectOfFloatingGroupHeader:(id)arg1
{
    return nil;
}

- (id)resetGroupsHorizontalOffset
{
    return nil;
}
@end

@implementation IKImageBrowserView (ikediting)

- (id)_delegateSupportsEditing
{
    return nil;
}

- (id)_editingGetAnchroPoint:(id)arg1 size:(id)arg2 forCellAtIndex:(id)arg3
{
    return nil;
}

- (id)_sendTextDidEndEditingAtIndex:(id)arg1
{
    return nil;
}

- (id)canEditTitleOfCellAtIndex:(id)arg1
{
    return nil;
}

- (id)currentEditor
{
    return nil;
}

- (id)didLooseFocus
{
    return nil;
}

- (id)editCellTitleAtIndex:(id)arg1
{
    return nil;
}

- (id)editCellTitleAtIndex:(id)arg1 withEvent:(id)arg2 select:(id)arg3
{
    return nil;
}

- (id)editGroupTitleAtIndex:(id)arg1
{
    return nil;
}

- (id)editingIndex
{
    return nil;
}

- (id)prepareEditingAtIndex:(id)arg1
{
    return nil;
}

- (id)stopEditing
{
    return nil;
}

- (id)textDidCancelEditing
{
    return nil;
}

- (void)textDidEndEditing:(id)arg1
{

}

- (BOOL)textShouldBeginEditing:(id)arg1
{
    return (BOOL){0};
}

- (BOOL)textShouldEndEditing:(id)arg1
{
    return (BOOL){0};
}

- (id)updateTitleEditingFrameIfNeeded
{
    return nil;
}
@end

@implementation IKImageBrowserView (private)

- (id)_titleAttributeKeys
{
    return nil;
}

- (id)anchorHorizontalSpacing
{
    return nil;
}

- (id)backgroundRed:(id)arg1 green:(id)arg2 blue:(id)arg3 alpha:(id)arg4
{
    return nil;
}

- (id)cellsOutlineRed:(id)arg1 green:(id)arg2 blue:(id)arg3
{
    return nil;
}

- (id)drawGrid
{
    return nil;
}

- (id)drawSchedulePriorityRanges
{
    return nil;
}

- (id)enableAutoAdaptativeQuality
{
    return nil;
}

- (id)flavorCellSize
{
    return nil;
}

- (id)flavorGridSize
{
    return nil;
}

- (id)getGridCellFrame:(id)arg1 anchorPoint:(id)arg2 coordinates:(id)arg3 atPoint:(id)arg4 gridOffset:(id)arg5
{
    return nil;
}

- (id)gridDimensions
{
    return nil;
}

- (id)gridDimensionsForLayoutParameters:(id)arg1
{
    return nil;
}

- (id)gridPositionAtIndex:(id)arg1
{
    return nil;
}

- (id)gridSpacing
{
    return nil;
}

- (id)iconSize
{
    return nil;
}

- (id)labelsOnRight
{
    return nil;
}

- (id)maxIconSize
{
    return nil;
}

- (id)selectionRed:(id)arg1 green:(id)arg2 blue:(id)arg3
{
    return nil;
}

- (id)setBlinkingMode:(id)arg1 forCellAtIndex:(id)arg2
{
    return nil;
}

- (void)setDrawGrid:(id)arg1
{

}

- (void)setDrawSchedulePriorityRanges:(id)arg1
{

}

- (void)setEnableAutoAdaptativeQuality:(id)arg1
{

}

- (void)setEnableVMScheduler:(id)arg1
{

}

- (void)setGridSpacing:(id)arg1
{

}

- (void)setIconSize:(id)arg1
{

}

- (void)setIconSizeFromCellSize:(id)arg1
{

}

- (void)setLabelsOnRight:(id)arg1
{

}

- (void)setMaxIconSize:(id)arg1
{

}

- (void)setShowItemInfo:(id)arg1
{

}

- (void)setTextSize:(id)arg1
{

}

- (id)updateCellSize
{
    return nil;
}

- (id)vmScheduler
{
    return nil;
}

- (id)vmSchedulerEnabled
{
    return nil;
}
@end

@implementation IKImageBrowserView (schedule_priority)

- (id)centerOfPriorityRange
{
    return nil;
}

- (id)schedulePriorityRange
{
    return nil;
}

- (id)vramBindedRange
{
    return nil;
}
@end

@implementation IKImageCropView (behaviors)

- (id)_originalImageBoundingBoxSizeIncludingRotation
{
    return nil;
}

- (id)acceptsDrop
{
    return nil;
}

- (id)allowEdit
{
    return nil;
}

- (id)allowRotations
{
    return nil;
}

- (id)borderType
{
    return nil;
}

- (id)checkBoundaries
{
    return nil;
}

- (id)checkZoomBoundaries
{
    return nil;
}

- (id)constrainMode
{
    return nil;
}

- (id)keepAtLeastOnePixelZoomRange
{
    return nil;
}

- (id)keepFocusMode
{
    return nil;
}

- (id)noHolesZoomRange
{
    return nil;
}

- (void)setAcceptsDrop:(id)arg1
{

}

- (void)setAllowEdit:(id)arg1
{

}

- (void)setAllowRotations:(id)arg1
{

}

- (void)setBorderType:(id)arg1
{

}

- (void)setConstrainMode:(id)arg1
{

}

- (void)setKeepFocusMode:(id)arg1
{

}

- (void)setShowLoadingIndicator:(id)arg1
{

}

- (void)setShowValidateButton:(id)arg1
{

}

- (void)setShowZoomMinMax:(id)arg1
{

}

- (void)setShowZoomSlider:(id)arg1
{

}

- (id)showLoadingIndicator
{
    return nil;
}

- (id)showValidateButton
{
    return nil;
}

- (id)showZoomMinMax
{
    return nil;
}

- (id)showZoomSlider
{
    return nil;
}
@end

@implementation IKImageCropView (dragndrop)

- (NSDragOperation)draggingEntered:(id)arg1
{
    return (NSDragOperation){0};
}

- (BOOL)performDragOperation:(id)arg1
{
    return (BOOL){0};
}
@end

@implementation IKImageCropView (drawing)

- (id)_nicestDraw
{
    return nil;
}

- (id)_postNicestDraw
{
    return nil;
}

- (id)_prepareNicestDraw:(id)arg1
{
    return nil;
}

- (id)drawAlphaFrame:(id)arg1
{
    return nil;
}

- (id)drawBack:(id)arg1
{
    return nil;
}

- (id)drawBorder:(id)arg1
{
    return nil;
}

- (id)drawContent
{
    return nil;
}

- (id)drawEffectGizmo
{
    return nil;
}

- (id)drawGizmo
{
    return nil;
}

- (id)drawImage:(id)arg1
{
    return nil;
}

- (id)drawInCell:(id)arg1 withRect:(id)arg2 inLiveResize:(id)arg3
{
    return nil;
}

- (void)drawRect:(NSRect)arg1
{

}

- (id)drawRotationGizmo
{
    return nil;
}

- (id)gizmoBoundingBoxForRadius:(id)arg1
{
    return nil;
}

- (id)initQCContextWithSize:(id)arg1
{
    return nil;
}

- (id)keepLastRenderedCIImage:(id)arg1
{
    return nil;
}

- (id)needPostNicestDraw
{
    return nil;
}

- (id)postNicestDraw
{
    return nil;
}

- (id)renderImageWithCIPipeline:(id)arg1 inRect:(id)arg2
{
    return nil;
}

- (id)rotationGizmoRadius
{
    return nil;
}

- (void)setDrawContent:(id)arg1
{

}
@end

@implementation IKImageCropView (effects)

- (id)_unlinkCIEffect:(id)arg1
{
    return nil;
}

- (id)addEffectWithName:(id)arg1 type:(id)arg2 position:(id)arg3
{
    return nil;
}

- (id)context
{
    return nil;
}

- (id)effects
{
    return nil;
}

- (id)hasEffect
{
    return nil;
}

- (id)qcComposition
{
    return nil;
}

- (id)reloadContext
{
    return nil;
}

- (id)removeAllEffects
{
    return nil;
}

- (id)removeEffect:(id)arg1
{
    return nil;
}

- (void)setQCComposition:(id)arg1
{

}
@end

@implementation IKImageCropView (events)

- (id)_mouseDragged:(id)arg1
{
    return nil;
}

- (id)_opaqueRect
{
    return nil;
}

- (BOOL)acceptsFirstMouse:(id)arg1
{
    return (BOOL){0};
}

- (id)gizmoHitTest:(id)arg1
{
    return nil;
}

- (void)keyDown:(id)arg1
{

}

- (void)keyUp:(id)arg1
{

}

- (void)magnifyWithEvent:(id)arg1
{

}

- (void)mouseDown:(id)arg1
{

}

- (void)mouseDragged:(id)arg1
{

}

- (void)mouseEntered:(id)arg1
{

}

- (void)mouseExited:(id)arg1
{

}

- (void)mouseUp:(id)arg1
{

}
@end

@implementation IKImageCropView (layout)

- (id)boundingRectOfOrientedRect:(id)arg1 rotation:(id)arg2 pivot:(id)arg3
{
    return nil;
}

- (id)cropRect
{
    return nil;
}

- (id)cropRectWithoutZoom
{
    return nil;
}

- (id)imageBoundingRect
{
    return nil;
}

- (id)imageRectWithoutRotations
{
    return nil;
}

- (id)roundSubRect:(id)arg1
{
    return nil;
}

- (id)roundedImageRectWithoutRotations
{
    return nil;
}

- (id)yTranslation
{
    return nil;
}
@end

@implementation IKImageCropView (rotation)

- (id)rotationForEvent:(id)arg1
{
    return nil;
}

- (id)snapRotation:(id)arg1
{
    return nil;
}
@end

@implementation IKImageCropView (utils)

- (id)convertScreenPositionToPRSPosition:(id)arg1
{
    return nil;
}

- (id)resourceImageNamed:(id)arg1
{
    return nil;
}
@end

@implementation IKImageCropView (zoom)

- (id)_setZoomValue:(id)arg1
{
    return nil;
}

- (id)_setZoomValueWithDisplay:(id)arg1
{
    return nil;
}

- (id)invalidateFocusPoint
{
    return nil;
}

- (id)limitZoomToMinFactor:(id)arg1 maxFactor:(id)arg2
{
    return nil;
}

- (id)onSliderMouseDown:(id)arg1 event:(id)arg2
{
    return nil;
}

- (id)onSliderMouseUp:(id)arg1 event:(id)arg2
{
    return nil;
}

- (id)privateSliderDidChanged:(id)arg1
{
    return nil;
}

- (id)scaleValue
{
    return nil;
}

- (void)setZoomValue:(id)arg1
{

}

- (id)updateFocusPoint
{
    return nil;
}

- (id)zoomMaxCallback:(id)arg1
{
    return nil;
}

- (id)zoomMin:(id)arg1 andMax:(id)arg2
{
    return nil;
}

- (id)zoomMinCallback:(id)arg1
{
    return nil;
}

- (id)zoomRange
{
    return nil;
}

- (id)zoomValue
{
    return nil;
}

- (id)zoomValueRelativeToZoomRange
{
    return nil;
}

- (id)zoomValueRelativeToZoomRange:(id)arg1
{
    return nil;
}
@end

@implementation IKImageEditPanel (IKImageEditPanelInternal)

- (id)adjustDisplayModes:(id)arg1
{
    return nil;
}

- (void)dealloc
{

}

- (id)dsHandler
{
    return nil;
}

- (void)finalize
{

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
@end

@implementation IKImageFlowCell (IKImageCellForward)

- (id)forwardingTargetForSelector:(id)arg1
{
    return nil;
}
@end

@implementation IKImageFlowView (IKAccessibilityAdditions)

- (id)__scrollerIsVisible
{
    return nil;
}

- (id)accessibilityAttributeNames
{
    return nil;
}

- (id)accessibilityAttributeValue:(id)arg1
{
    return nil;
}

- (id)accessibilityChildren
{
    return nil;
}

- (id)accessibilityHitTest:(NSPoint)arg1
{
    return nil;
}

- (NSUInteger)accessibilityIndexOfChild:(id)arg1
{
    return (NSUInteger){0};
}

- (BOOL)accessibilityIsAttributeSettable:(id)arg1
{
    return (BOOL){0};
}

- (BOOL)accessibilityIsIgnored
{
    return (BOOL){0};
}
@end

@implementation IKImageFlowView (IKDragNDrop)

- (id)_updateIndexAndDropOperationWithDrop:(id)arg1
{
    return nil;
}

- (void)concludeDragOperation:(id)arg1
{

}

- (id)copyDataToPasteboard:(id)arg1
{
    return nil;
}

- (id)dragStartPoint
{
    return nil;
}

- (id)draggedImage
{
    return nil;
}

- (void)draggedImage:(id)arg1 endedAt:(NSPoint)arg2 operation:(NSDragOperation)arg3
{

}

- (id)draggingDestinationDelegate
{
    return nil;
}

- (void)draggingEnded:(id)arg1
{

}

- (NSDragOperation)draggingEntered:(id)arg1
{
    return (NSDragOperation){0};
}

- (void)draggingExited:(id)arg1
{

}

- (NSDragOperation)draggingUpdated:(id)arg1
{
    return (NSDragOperation){0};
}

- (id)dropOverCell
{
    return nil;
}

- (id)indexAtLocationOfDroppedItem
{
    return nil;
}

- (BOOL)performDragOperation:(id)arg1
{
    return (BOOL){0};
}

- (BOOL)prepareForDragOperation:(id)arg1
{
    return (BOOL){0};
}

- (void)setDraggingDestinationDelegate:(id)arg1
{

}

- (void)setIsDraggingOver:(id)arg1
{

}

- (id)startDragNDropWithEvent:(id)arg1
{
    return nil;
}
@end

@implementation IKImageFlowView (IKEvent)

- (id)_scrollerEventForEvent:(id)arg1
{
    return nil;
}

- (BOOL)acceptsFirstMouse:(id)arg1
{
    return (BOOL){0};
}

- (id)acceptsFirstResponder
{
    return nil;
}

- (BOOL)becomeFirstResponder
{
    return (BOOL){0};
}

- (void)beginGestureWithEvent:(id)arg1
{

}

- (id)cellIndexAtMouseEvent:(id)arg1
{
    return nil;
}

- (id)defaultDoubleClickAction:(id)arg1
{
    return nil;
}

- (id)deleteSelection
{
    return nil;
}

- (void)endGestureWithEvent:(id)arg1
{

}

- (id)handleDoubleClickOnCellAtIndex:(id)arg1
{
    return nil;
}

- (void)keyDown:(id)arg1
{

}

- (void)mouseDown:(id)arg1
{

}

- (void)mouseDragged:(id)arg1
{

}

- (void)mouseEntered:(id)arg1
{

}

- (void)mouseExited:(id)arg1
{

}

- (void)mouseUp:(id)arg1
{

}

- (BOOL)resignFirstResponder
{
    return (BOOL){0};
}

- (void)scrollWheel:(id)arg1
{

}

- (BOOL)shouldDelayWindowOrderingForEvent:(id)arg1
{
    return (BOOL){0};
}

- (id)splitterTrackingRect
{
    return nil;
}

- (void)updateTrackingAreas
{

}
@end

@implementation IKImageFlowView (IKInlinePreview)

- (id)_inlinePreviewLayerTreeDidChange
{
    return nil;
}

- (id)_inlinePreviewRedisplay
{
    return nil;
}

- (id)_reflectionFrame
{
    return nil;
}

- (id)_showOverlayIfNeeded
{
    return nil;
}

- (id)displayedImageFrame
{
    return nil;
}

- (id)drawInlinePreview
{
    return nil;
}

- (id)inlinePreview:(id)arg1 didChangeToState:(id)arg2
{
    return nil;
}

- (id)inlinePreview:(id)arg1 didLoadPreviewItem:(id)arg2
{
    return nil;
}

- (id)inlinePreview:(id)arg1 frameForPreviewItem:(id)arg2
{
    return nil;
}

- (id)inlinePreviewController
{
    return nil;
}

- (id)inlinePreviewEnabled
{
    return nil;
}

- (id)inlinePreviewIsVisible
{
    return nil;
}

- (id)inlinePreviewItemForCellAtIndex:(id)arg1
{
    return nil;
}

- (id)inlinePreviewMouseDown:(id)arg1
{
    return nil;
}

- (id)inlinePreviewMouseEntered:(id)arg1
{
    return nil;
}

- (id)inlinePreviewMouseExited:(id)arg1
{
    return nil;
}

- (id)inlinePreviewShouldAlwaysHandleMultiClicks:(id)arg1
{
    return nil;
}

- (id)inlinePreviewView
{
    return nil;
}

- (id)previewPanel:(id)arg1 transitionImageForPreviewItem:(id)arg2 contentRect:(id)arg3
{
    return nil;
}

- (id)removeInlinePreview
{
    return nil;
}

- (void)setInlinePreviewEnabled:(id)arg1
{

}

- (void)setSharingPreviewPanel:(id)arg1
{

}

- (id)setupInlinePreview
{
    return nil;
}

- (id)sharingPreviewPanel
{
    return nil;
}

- (id)startInlinePreview
{
    return nil;
}

- (id)startInlinePreviewWithReflectedLayer:(id)arg1
{
    return nil;
}

- (id)stopInlinePreview
{
    return nil;
}

- (id)stopPlayingInlinePreview
{
    return nil;
}

- (id)unsetupInlinePreview
{
    return nil;
}

- (id)updateInlinePreview
{
    return nil;
}

- (id)updateInlinePreviewTrackingAreas
{
    return nil;
}
@end

@implementation IKImageFlowView (animationManagerDelegate)

- (id)animationValueForKey:(id)arg1 forCell:(id)arg2
{
    return nil;
}

- (id)initAppearingAnimationWithItems:(id)arg1 diff:(id)arg2
{
    return nil;
}

- (id)initImportAnimationWithIndexes:(id)arg1
{
    return nil;
}

- (id)initMovingAndDisappearingAnimationWithItems:(id)arg1 diff:(id)arg2
{
    return nil;
}
@end

@implementation IKImageFlowView (ik_scrolling)

- (id)_autoSelectCallback
{
    return nil;
}

- (id)_scrollingAnimationCallback
{
    return nil;
}

- (id)animateScrolling
{
    return nil;
}

- (id)autoscrollCallBack
{
    return nil;
}

- (id)autoscrollWithLocalPoint:(id)arg1
{
    return nil;
}

- (id)scrollBy:(id)arg1
{
    return nil;
}

- (id)scrollerDidChange:(id)arg1
{
    return nil;
}

- (id)setScrollerValueFromSelection
{
    return nil;
}

- (id)startAutoscroll
{
    return nil;
}

- (id)stopAutoscroll
{
    return nil;
}

- (id)stopScrollingAnimation
{
    return nil;
}
@end

@implementation IKImageFlowView (tasks)

- (id)__performSynchronousTasksIfAnyInSecondaryThread:(id)arg1 delegate:(id)arg2
{
    return nil;
}

- (id)_cancelSynchronousTask
{
    return nil;
}

- (id)_didComputeThumbnail:(id)arg1
{
    return nil;
}

- (id)_didImportAsynchronousThumbnail:(id)arg1
{
    return nil;
}

- (id)_didImportThumbnail:(id)arg1
{
    return nil;
}

- (id)_freeTemporaryCacheStepWithVisibleIndexes:(id)arg1
{
    return nil;
}

- (id)_importThumbnails:(id)arg1 state:(id)arg2
{
    return nil;
}

- (id)_needImport:(id)arg1 forCellSize:(id)arg2
{
    return nil;
}

- (id)_prepareThumbnailBuildersForCells:(id)arg1 size:(id)arg2 start:(id)arg3 quality:(id)arg4 skipPlaceHolders:(id)arg5 arrayOut:(id)arg6
{
    return nil;
}

- (id)_rangeToPrefetch
{
    return nil;
}

- (id)_shouldProcessLongTasks
{
    return nil;
}

- (id)_taskRedisplay
{
    return nil;
}

- (id)_updateTasksCellsCopy
{
    return nil;
}

- (id)abortFreeTemporaryCache
{
    return nil;
}

- (id)abortImportVisibleCells
{
    return nil;
}

- (id)abortNicestRendering
{
    return nil;
}

- (id)abortPrefetchThumbnails
{
    return nil;
}

- (id)cellsArrayForTasks
{
    return nil;
}

- (id)didImportCell:(id)arg1 thumbnail:(id)arg2 visible:(id)arg3
{
    return nil;
}

- (id)freeTemporaryCacheProgress
{
    return nil;
}

- (id)importVisibleCellsPriority
{
    return nil;
}

- (id)nicestRenderingDelay
{
    return nil;
}

- (id)nicestRenderingExpendStep
{
    return nil;
}

- (id)nicestRenderingLoop
{
    return nil;
}

- (id)nicestRenderingPriority
{
    return nil;
}

- (id)nicestRenderingProgress
{
    return nil;
}

- (id)performSynchronousTasksIfAny
{
    return nil;
}

- (id)prefetchThumbnailsDelay
{
    return nil;
}

- (id)prefetchThumbnailsProgress
{
    return nil;
}

- (id)prepareThumbnailBuilderForCell:(id)arg1 size:(id)arg2 quality:(id)arg3
{
    return nil;
}

- (id)prepareThumbnailBuildersForCells:(id)arg1 size:(id)arg2 quality:(id)arg3 skipPlaceHolders:(id)arg4
{
    return nil;
}

- (id)registerTasks
{
    return nil;
}

- (id)restartTasks
{
    return nil;
}

- (id)shouldStartTaskNamed:(id)arg1
{
    return nil;
}

- (id)startFreeTemporaryCache
{
    return nil;
}

- (id)startImportVisibleCells
{
    return nil;
}

- (id)startNicestRendering
{
    return nil;
}

- (id)startPrefetchThumbnails
{
    return nil;
}

- (id)taskManager
{
    return nil;
}
@end

@implementation IKImageState (priv)

- (BOOL)containsValueForKey:(id)arg1
{
    return (BOOL){0};
}

- (id)dictionary
{
    return nil;
}

- (id)filterArray
{
    return nil;
}

- (id)initWithDictionary:(id)arg1
{
    return nil;
}

- (id)rotationAngle
{
    return nil;
}

- (id)selectionInfo
{
    return nil;
}

- (void)setRotationAngle:(id)arg1
{

}

- (void)setSelectionInfo:(id)arg1
{

}

- (void)setVisibleCenter:(id)arg1
{

}

- (id)visibleCenter
{
    return nil;
}
@end

@implementation IKImageView (IKImageViewInternal)

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

- (id)composer
{
    return nil;
}

- (void)concludeDragOperation:(id)arg1
{

}

- (id)connectToBackgroundLayer
{
    return nil;
}

- (NSDragOperation)draggingEntered:(id)arg1
{
    return (NSDragOperation){0};
}

- (void)draggingExited:(id)arg1
{

}

- (id)embedded
{
    return nil;
}

- (id)filterAdded:(id)arg1 filterChain:(id)arg2
{
    return nil;
}

- (id)filterChain
{
    return nil;
}

- (id)filterRemoved:(id)arg1 filterChain:(id)arg2
{
    return nil;
}

- (id)imageLayer
{
    return nil;
}

- (id)invalidateCursorRects
{
    return nil;
}

- (BOOL)performDragOperation:(id)arg1
{
    return (BOOL){0};
}

- (BOOL)respondsToSelector:(SEL)arg1
{
    return (BOOL){0};
}

- (id)saveScrollInfo:(id)arg1 scaling:(id)arg2
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

- (void)setEmbedded:(id)arg1
{

}

- (void)setFilterChain:(id)arg1
{

}

- (void)setImage:(id)arg1
{

}

- (void)setImageAlignment:(id)arg1
{

}

- (void)setImageFrameStyle:(id)arg1
{

}

- (void)setImageScaling:(id)arg1
{

}

- (void)setReuseImageLayer:(id)arg1
{

}

- (id)showInspector:(id)arg1
{
    return nil;
}
@end

@implementation IKImageView (IKPrivate)

- (id)addLayer:(id)arg1 linkedTo:(id)arg2
{
    return nil;
}

- (id)animates
{
    return nil;
}

- (id)annotationType
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

- (id)filter:(id)arg1 setValue:(id)arg2 forKey:(id)arg3
{
    return nil;
}

- (id)filter:(id)arg1 valueForKey:(id)arg2
{
    return nil;
}

- (id)filterArray
{
    return nil;
}

- (id)filterChainChanged:(id)arg1
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

- (id)layerOfType:(id)arg1
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

- (id)selectionRect
{
    return nil;
}

- (void)setAnimates:(id)arg1
{

}

- (void)setAnnotationType:(id)arg1
{

}

- (id)setCIImage:(id)arg1 imageProperties:(id)arg2
{
    return nil;
}

- (void)setFilterArray:(id)arg1
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

- (void)setSelectionRect:(id)arg1
{

}

- (id)updateImageEditPanelIfNeeded
{
    return nil;
}

- (BOOL)validateMenuItem:(id)arg1
{
    return (BOOL){0};
}

- (id)writeImageAtIndex:(id)arg1 toFile:(id)arg2 options:(id)arg3
{
    return nil;
}
@end

@implementation IKImageView2 (IKImageAnalysisOverlayViewDelegate)

- (id)imageAnalysisManagerAllowsCopyAndSharing:(id)arg1
{
    return nil;
}
@end

@implementation IKPictureTakerRecentPicture (PopoverAdditions)

- (id)imageRepresentation
{
    return nil;
}

- (id)imageRepresentationType
{
    return nil;
}

- (id)imageUID
{
    return nil;
}
@end

@implementation IKSSBackgroundWindow (Accessibility)

- (id)accessibilityAttributeValue2:(id)arg1
{
    return nil;
}

- (id)accessibilityAttributeValue:(id)arg1
{
    return nil;
}

- (id)accessibilityHitTest:(NSPoint)arg1
{
    return nil;
}

- (BOOL)accessibilityIsIgnored
{
    return (BOOL){0};
}
@end

@implementation IKScanUIControllerAdvanced (IKAdjustUI)

- (id)addNegativeTransparencyDocumentKinds:(id)arg1
{
    return nil;
}

- (id)addPositiveTransparencyDocumentKinds:(id)arg1
{
    return nil;
}

- (id)addStandardDocumentKinds:(id)arg1
{
    return nil;
}

- (id)bitDepthPopupChanged:(id)arg1
{
    return nil;
}

- (id)combineToSinglePageCheckBoxChanged:(id)arg1
{
    return nil;
}

- (void)comboBoxSelectionDidChange:(id)arg1
{

}

- (void)controlTextDidChange:(id)arg1
{

}

- (void)controlTextDidEndEditing:(id)arg1
{

}

- (id)detectSeparateItemsPopupChanged:(id)arg1
{
    return nil;
}

- (id)ditherChanged:(id)arg1
{
    return nil;
}

- (id)documentKindPopupChanged:(id)arg1
{
    return nil;
}

- (id)downloadsDirectoryChanged:(id)arg1
{
    return nil;
}

- (id)duplexCheckboxChanged:(id)arg1
{
    return nil;
}

- (id)evenPageOrientationChanged:(id)arg1
{
    return nil;
}

- (id)fileFormatPopupChanged:(id)arg1
{
    return nil;
}

- (id)fixedSizeChanged:(id)arg1
{
    return nil;
}

- (id)fixedSizePopupChanged:(id)arg1
{
    return nil;
}

- (id)functionalUnitPopupChanged:(id)arg1
{
    return nil;
}

- (id)handleFileFormatChangeToTag:(id)arg1 fromTag:(id)arg2
{
    return nil;
}

- (id)imageCorrectionPopupChanged:(id)arg1
{
    return nil;
}

- (id)oddPageOrientationChanged:(id)arg1
{
    return nil;
}

- (id)orientationChanged:(id)arg1
{
    return nil;
}

- (id)postProcessApplicationChanged:(id)arg1
{
    return nil;
}

- (id)resolutionComboBoxChanged:(id)arg1
{
    return nil;
}

- (id)resolutionPopupChanged:(id)arg1
{
    return nil;
}

- (id)setScanResolution:(id)arg1 snapToValid:(id)arg2
{
    return nil;
}

- (id)templateSelectionChanged:(id)arg1
{
    return nil;
}

- (id)unitsPopupChanged:(id)arg1
{
    return nil;
}

- (id)updateBitDepthPopup
{
    return nil;
}

- (id)updateBitDepthPopup:(id)arg1 isColor:(id)arg2
{
    return nil;
}

- (id)updateCombineToSinglePageCheckBoxUI
{
    return nil;
}

- (id)updateCustomSizeCheckBoxUI
{
    return nil;
}

- (id)updateDestinationUI
{
    return nil;
}

- (id)updateDetectItemsUI
{
    return nil;
}

- (id)updateDocumentKindPopup
{
    return nil;
}

- (id)updateDuplexUI
{
    return nil;
}

- (id)updateFileFormatUI
{
    return nil;
}

- (id)updateFixedSizeUI
{
    return nil;
}

- (id)updateFunctionalUnitPopup
{
    return nil;
}

- (id)updateGeometryUI
{
    return nil;
}

- (id)updateImageCorrectionPopup
{
    return nil;
}

- (id)updateNameField
{
    return nil;
}

- (id)updateOrientationUI
{
    return nil;
}

- (id)updateOrientationUIDocFeeder
{
    return nil;
}

- (id)updateResolutionComboBox
{
    return nil;
}

- (id)updateResolutionPopup
{
    return nil;
}

- (id)updateRotationUI
{
    return nil;
}

- (id)updateTemplatesUI
{
    return nil;
}

- (id)updateUserSettableControls
{
    return nil;
}

- (id)useCustomSizeCheckBoxChanged:(id)arg1
{
    return nil;
}
@end

@implementation NSAttributedString (IKEditingExtensions)

- (id)IKSizeOfTextForWidth:(id)arg1 textView:(id)arg2
{
    return nil;
}
@end

@implementation NSAttributedString (IKIconCellMetrics)

- (id)getMetrics:(id)arg1 containerSize:(id)arg2 wrap:(id)arg3 alignment:(id)arg4 tagOffset:(id)arg5
{
    return nil;
}
@end

@implementation NSBitmapImageRep (ik_cgexamples)

- (id)IKCreateCGImage
{
    return nil;
}
@end

@implementation NSButton (IKScanButton)

- (id)detailedDescription
{
    return nil;
}
@end

@implementation NSCollectionView (IK)

- (id)beginDraggingSessionWithItems:(id)arg1 event:(id)arg2 source:(id)arg3
{
    return nil;
}

- (id)cellsStyleMask
{
    return nil;
}

- (id)iconSizeChanged:(id)arg1
{
    return nil;
}

- (id)reloadCellDataAtIndex:(id)arg1
{
    return nil;
}

- (void)setAnimates:(id)arg1
{

}

- (void)setCellsStyleMask:(id)arg1
{

}

- (void)setDraggingDestinationDelegate:(id)arg1
{

}

- (void)setEnablePrefetch:(id)arg1
{

}

- (void)setImageBrowserFlavor:(id)arg1
{

}

- (void)setZoomValue:(id)arg1
{

}
@end

@implementation NSColor (IKAdditions)

- (id)IKGetComponentsRed:(id)arg1 green:(id)arg2 blue:(id)arg3 alpha:(id)arg4
{
    return nil;
}
@end

@implementation NSFont (IKCommonFonts)

- (id)ik_isSystemFont
{
    return nil;
}
@end

@implementation NSImage (IKAdditions)

- (id)IKAnimatedRepresentation
{
    return nil;
}

- (id)IKFixDPI
{
    return nil;
}

- (id)IKSize
{
    return nil;
}

- (id)IK_GIFRepresentation
{
    return nil;
}

- (id)IK_JPEGRepresentationWithCompressionFactor:(id)arg1
{
    return nil;
}

- (id)IK_PNGRepresentationWithCompressionFactor:(id)arg1
{
    return nil;
}

- (id)IK_TIFFRepresentationWithCompressionFactor:(id)arg1
{
    return nil;
}

- (id)ikDetectedFaces
{
    return nil;
}

- (id)ikFaceRect
{
    return nil;
}

- (id)ikSquareThumbnailOfSize:(id)arg1 scaleMode:(id)arg2
{
    return nil;
}

- (id)ikSquareThumbnailOfSize:(id)arg1 scaleMode:(id)arg2 makeOpaque:(id)arg3 ignoreBackingScaleFactor:(id)arg4
{
    return nil;
}
@end

@implementation NSImage (IKProfilePictureViewAdditions)

- (id)ikProfilePictureAttributedImageName
{
    return nil;
}

- (void)setIkProfilePictureAttributedImageName:(id)arg1
{

}
@end

@implementation NSImageRep (IKAdditions)

- (id)IKPixelsHigh
{
    return nil;
}

- (id)IKPixelsWide
{
    return nil;
}
@end

@implementation NSImageView (IC)

- (id)contentClippingRect
{
    return nil;
}

- (id)photoRectInImageView
{
    return nil;
}

- (id)photoReduction
{
    return nil;
}
@end

@implementation NSMenu (FileFormat)

- (id)addFileFormatWithTitle:(id)arg1 tag:(id)arg2 representedObject:(id)arg3 target:(id)arg4
{
    return nil;
}
@end

@implementation NSObject (AssociatedObject)

- (id)associatedObject
{
    return nil;
}

- (void)setAssociatedObject:(id)arg1
{

}
@end

@implementation NSObject (IKImageBrowserItemOptional)

- (id)IKImageRepresentationWithType:(id)arg1
{
    return nil;
}

- (id)_viewIdentifier
{
    return nil;
}

- (id)imageSubtitle
{
    return nil;
}

- (id)imageTitle
{
    return nil;
}

- (id)imageToDrawForCell:(id)arg1
{
    return nil;
}
@end

@implementation NSObject (IKImageBrowserViewOptionalDelegateMethods)

- (id)imageBrowser:(id)arg1 didValidateVisibleCellsAtIndexes:(id)arg2
{
    return nil;
}

- (id)imageBrowser:(id)arg1 willDisplayCellsAtIndexes:(id)arg2
{
    return nil;
}
@end

@implementation NSObject (IKInterThread)

- (id)ikInMainLoopWait:(id)arg1
{
    return nil;
}
@end

@implementation NSPopUpButton (IKSO)

- (id)ikSelectItemWithRepresentedObject:(id)arg1
{
    return nil;
}

- (id)ikSelectedRepresentedObject
{
    return nil;
}
@end

@implementation NSScroller (IKImageBrowserAdditions)

- (id)IKAccelerationCoefiscient
{
    return nil;
}
@end

@implementation NSString (IKCameraDownloader)

- (id)baseName
{
    return nil;
}
@end

@implementation NSString (IKScanConstraints)

- (id)firstViewName
{
    return nil;
}

- (id)firstViewNameWithPriority
{
    return nil;
}

- (id)lastViewName
{
    return nil;
}

- (id)lastViewNameWithPriority
{
    return nil;
}

- (id)viewArray
{
    return nil;
}

- (id)viewAtIndex:(id)arg1
{
    return nil;
}

- (id)viewCount
{
    return nil;
}

- (id)viewWithPriorityArray
{
    return nil;
}

- (id)viewWithPriorityAtIndex:(id)arg1
{
    return nil;
}
@end

@implementation NSString (LeftPadding)

- (id)stringByLeftPaddingToLength:(id)arg1 withString:(id)arg2 startingAtIndex:(id)arg3
{
    return nil;
}
@end

@implementation NSTreeNode (IK)

- (id)imageRepresentation
{
    return nil;
}

- (id)imageRepresentationType
{
    return nil;
}

- (id)imageTitle
{
    return nil;
}

- (id)imageUID
{
    return nil;
}
@end
