/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 */

#import "IKImageBrowserView.h"

@implementation IKImageBrowserView

- (instancetype)initWithFrame:(NSRect)frameRect
{
    self = [super initWithFrame:frameRect];
    if (self)
    {
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self)
    {
    }
    return self;
}

- (void)reloadData
{
}

- (void)setNeedsDisplay
{
    [super setNeedsDisplay:YES];
}
- (void)setDataSource:(id)dataSource
{
}

- (id)dataSource
{
    return nil;
}

- (void)setDelegate:(id)delegate
{
}

- (id)delegate
{
    return nil;
}

- (void)setAllowsMultipleSelection:(BOOL)flag
{
}

- (BOOL)allowsMultipleSelection
{
    return NO;
}

- (void)setSelectionIndexes:(NSIndexSet *)indexes
{
}

- (NSIndexSet *)selectionIndexes
{
    return [NSIndexSet indexSet];
}
- (void)setZoomValue:(double)zoom
{
}

- (double)zoomValue
{
    return 1.0;
}

/* --- generated selector-parity stubs --- */
- (id)_IKOpenGLContextMayDie
{
    return nil;
}

- (id)__copyGLToCurrentFocusedView
{
    return nil;
}

- (id)__didComputeThumbnail:(id)arg1
{
    return nil;
}

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

- (id)__heightOfSubtitle
{
    return nil;
}

- (id)__heightOfTitle
{
    return nil;
}

- (id)__ikSetupGLContext:(id)arg1
{
    return nil;
}

- (id)__ikVisibleRect
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

- (id)_additionalOffsetForContentInset
{
    return nil;
}

- (id)_adjustDocumentOffset:(id)arg1
{
    return nil;
}

- (id)_adjustDocumentSize
{
    return nil;
}

- (id)_adjustFreeFormLayout
{
    return nil;
}

- (id)_adjustGridRowMargin
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

- (id)_animationForGroupedItems:(id)arg1 expand:(id)arg2
{
    return nil;
}

- (id)_antialiasLevelChanged
{
    return nil;
}

- (id)_assertContextIsInstalledAsCurrentContext
{
    return nil;
}

- (id)_autoExpendiOSForDrag
{
    return nil;
}

- (id)_backingStoreDidChange
{
    return nil;
}

- (id)_beginLayoutTransaction
{
    return nil;
}

- (id)_boundsForCARenderer
{
    return nil;
}

- (id)_browserCellFromEvent:(id)arg1
{
    return nil;
}

- (id)_buildSlideShowIndexesArray
{
    return nil;
}

- (id)_cacheDidPurge:(id)arg1
{
    return nil;
}

- (id)_cacheWillPurge:(id)arg1
{
    return nil;
}

- (id)_calculateDraggingOperationWithDrop:(id)arg1
{
    return nil;
}

- (id)_cancelSynchronousTask
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

- (id)_cellIndexesToImport
{
    return nil;
}

- (id)_cellsToImport:(id)arg1
{
    return nil;
}

- (id)_checkForVisibleCellIndexesChange
{
    return nil;
}

- (id)_colorProfileDidChange
{
    return nil;
}

- (id)_commitLayoutTransaction
{
    return nil;
}

- (id)_containsCell:(id)arg1
{
    return nil;
}

- (id)_convertColor:(id)arg1 toRed:(id)arg2 green:(id)arg3 blue:(id)arg4 alpha:(id)arg5
{
    return nil;
}

- (id)_currentScrollingAnimation
{
    return nil;
}

- (id)_currentSelectionFrame
{
    return nil;
}

- (id)_currentViewOffset
{
    return nil;
}

- (id)_delayedCacheDefragmentation
{
    return nil;
}

- (id)_delayedUpdateiOSPresentationDatasource:(id)arg1
{
    return nil;
}

- (id)_delegateSupportsEditing
{
    return nil;
}

- (id)_deleteContextIfAny
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

- (id)_didStabilize
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

- (id)_drawCALayer:(id)arg1 forceUpdateRect:(id)arg2
{
    return nil;
}

- (id)_drawDebugRange:(id)arg1 withOffset:(id)arg2
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

- (id)_drawQCBackground
{
    return nil;
}

- (id)_drawRect:(id)arg1
{
    return nil;
}

- (id)_editingGetAnchroPoint:(id)arg1 size:(id)arg2 forCellAtIndex:(id)arg3
{
    return nil;
}

- (id)_effectiveLayerBoundsForTransforms
{
    return nil;
}

- (id)_emptyGLCaches
{
    return nil;
}

- (id)_enableSyncTasksForRegularImport
{
    return nil;
}

- (id)_enclosingClipViewDidChange:(id)arg1
{
    return nil;
}

- (id)_endScrollingInGroup:(id)arg1
{
    return nil;
}

- (id)_expandButtonClicked:(id)arg1
{
    return nil;
}

- (id)_focusDidChange:(id)arg1
{
    return nil;
}

- (id)_focusImageAtIndex:(id)arg1 progressive:(id)arg2
{
    return nil;
}

- (id)_freeCacheStepWithVisibleIndexes:(id)arg1 range:(id)arg2 progress:(id)arg3
{
    return nil;
}

- (id)_groupIsSelected:(id)arg1
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

- (id)_ikAllocReservedIfNeeded
{
    return nil;
}

- (id)_ikCommonInit:(id)arg1
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

- (id)_ikVisibleRect
{
    return nil;
}

- (id)_ikVisibleRectMinusContentInset
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

- (id)_importThumbnails:(id)arg1 state:(id)arg2
{
    return nil;
}

- (id)_indexesToDimForGroup:(id)arg1
{
    return nil;
}

- (id)_indexesToPrefetch
{
    return nil;
}

- (id)_initNicestRenderingCellOrderedIndexes
{
    return nil;
}

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

- (id)_internalNextTypeSelectMatchFromIndex:(id)arg1 toIndex:(id)arg2 forString:(id)arg3
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

- (id)_needImport:(id)arg1 forCellSize:(id)arg2
{
    return nil;
}

- (id)_needToPrefetchCell:(id)arg1
{
    return nil;
}

- (id)_neighbourhoodIndexesWithCacheSize:(id)arg1 cellSize:(id)arg2
{
    return nil;
}

- (id)_newCellForRepresentedItem:(id)arg1
{
    return nil;
}

- (id)_nextSelectionIndexesWithIndexesInRect:(id)arg1 withModifier:(id)arg2
{
    return nil;
}

- (id)_nicestRederingCellIndexAtIndex:(id)arg1
{
    return nil;
}

- (id)_offsetToFocusItemAtIndex:(id)arg1
{
    return nil;
}

- (id)_onQCTimer
{
    return nil;
}

- (id)_openGLContextDidChange
{
    return nil;
}

- (id)_patchFrameForContentInset:(id)arg1
{
    return nil;
}

- (id)_performAsyncImportIfAny:(id)arg1 delegate:(id)arg2
{
    return nil;
}

- (id)_performTypeSelect:(id)arg1
{
    return nil;
}

- (id)_postCleanDegradedRendering
{
    return nil;
}

- (id)_prefetchThumbnails:(id)arg1 state:(id)arg2
{
    return nil;
}

- (id)_prepareThumbnailBuildersForCells:(id)arg1 size:(id)arg2 start:(id)arg3 quality:(id)arg4 rule:(id)arg5 arrayOut:(id)arg6
{
    return nil;
}

- (id)_progressBarRect
{
    return nil;
}

- (id)_propagateTitleAttributes:(id)arg1 toFinderSpecificAttributeKey:(id)arg2 excludeLineBreakMode:(id)arg3
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

- (id)_refreshUserDefaultsForInlinePreview
{
    return nil;
}

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

- (id)_rightMouseDown:(id)arg1
{
    return nil;
}

- (id)_scaleFactorDidChange:(id)arg1
{
    return nil;
}

- (id)_scrollIndexToVisible:(id)arg1
{
    return nil;
}

- (id)_scrollPageInDirection:(id)arg1
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

- (id)_sendTextDidEndEditingAtIndex:(id)arg1
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

- (id)_setScrollingGroup:(id)arg1
{
    return nil;
}

- (id)_setSelectionColorRed:(id)arg1 green:(id)arg2 blue:(id)arg3
{
    return nil;
}

- (id)_setSelectionIndexes:(id)arg1 byExtendingSelection:(id)arg2 notifyObservers:(id)arg3
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

- (id)_shouldProcessLongTasks
{
    return nil;
}

- (id)_sidebarBottomColor:(id)arg1 topColor:(id)arg2
{
    return nil;
}

- (id)_sizeToImportForCell:(id)arg1
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

- (id)_startDelayedTitleEditingWithEvent
{
    return nil;
}

- (id)_stopAutoscroll
{
    return nil;
}

- (id)_superviewBoundsDidChange:(id)arg1
{
    return nil;
}

- (id)_surfaceNeedsUpdate:(id)arg1
{
    return nil;
}

- (id)_systemColorsDidChange
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

- (id)_taskRedisplay
{
    return nil;
}

- (id)_tileBackgroundImageInRect:(id)arg1
{
    return nil;
}

- (id)_titleAttributeKeys
{
    return nil;
}

- (id)_toggleGroup:(id)arg1 expand:(id)arg2 animates:(id)arg3
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

- (id)_unhighlightiOSItemAtIndex:(id)arg1
{
    return nil;
}

- (id)_updateCurrentAutoscrollInGroupValueWithPoint:(id)arg1
{
    return nil;
}

- (id)_updateDraggingItemsForDrag:(id)arg1
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

- (id)_updateIndexAndDropOperationWithDrop:(id)arg1
{
    return nil;
}

- (id)_updateTasksCellsCopy
{
    return nil;
}

- (id)_updateiOSGroupsRangeByMovingItemFromIndex:(id)arg1 toIndex:(id)arg2
{
    return nil;
}

- (id)_viewIdentifier
{
    return nil;
}

- (id)_waitForPendingiOSGroupAnimations
{
    return nil;
}

- (id)_willCloseWindow:(id)arg1
{
    return nil;
}

- (id)_willInitWithCoder
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

- (id)abortSchedule
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

- (id)acceptsPreviewPanelControl:(id)arg1
{
    return nil;
}

- (id)accessibilityItemForCell:(id)arg1 atIndex:(id)arg2
{
    return nil;
}

- (id)addToolTip:(id)arg1 inRect:(id)arg2
{
    return nil;
}

- (id)adjustDocumentSize
{
    return nil;
}

- (id)adjustFreeFormScaleFactor
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

- (id)allowRolloverInlinePreviewForCellAtIndex:(id)arg1
{
    return nil;
}

- (id)allowsDropOnItems
{
    return nil;
}

- (id)allowsDroppingOnItems
{
    return nil;
}

- (id)allowsEmptySelection
{
    return nil;
}

- (id)allowsInlinePreviews
{
    return nil;
}

- (id)allowsReordering
{
    return nil;
}

- (id)allowsTypeSelect
{
    return nil;
}

- (id)alternateMagnifying:(id)arg1
{
    return nil;
}

- (id)amountOfMemoryOfCurrentDataSource:(id)arg1
{
    return nil;
}

- (id)anchorHorizontalSpacing
{
    return nil;
}

- (id)animates
{
    return nil;
}

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

- (id)appearanceStyle
{
    return nil;
}

- (void)applicationWillTerminate:(id)arg1
{

}

- (id)arrowKeyDown:(id)arg1 withModifier:(id)arg2
{
    return nil;
}

- (id)autoEnableSubpixelAntialiasing
{
    return nil;
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

- (id)backBufferIsValid
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

- (id)backgroundRed:(id)arg1 green:(id)arg2 blue:(id)arg3 alpha:(id)arg4
{
    return nil;
}

- (id)backgroundRequiresTextHighlight
{
    return nil;
}

- (id)beginPreviewPanelControl:(id)arg1
{
    return nil;
}

- (id)beginTransaction:(id)arg1
{
    return nil;
}

- (id)browserDidScroll
{
    return nil;
}

- (id)bumpDatasourceVersion
{
    return nil;
}

- (id)caNeedsDisplay
{
    return nil;
}

- (id)caRenderer
{
    return nil;
}

- (id)cacheManager
{
    return nil;
}

- (id)canControlQuickLookPanel
{
    return nil;
}

- (id)canEditTitleOfCellAtIndex:(id)arg1
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

- (id)cellAtIndex:(NSInteger)arg1
{
    return nil;
}

- (id)cellAtIndexIsCollapsed:(id)arg1
{
    return nil;
}

- (id)cellClass
{
    return nil;
}

- (id)cellDocumentRectAtIndex:(id)arg1
{
    return nil;
}

- (id)cellForItemAtIndex:(id)arg1
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

- (id)cellIndexForInlinePreviewController:(id)arg1
{
    return nil;
}

- (id)cellMaximumSizeForCurrentBounds
{
    return nil;
}

- (NSSize)cellSize
{
    return (NSSize){0};
}

- (id)cellWillDrawPlaceHolder:(id)arg1
{
    return nil;
}

- (id)cells
{
    return nil;
}

- (id)cellsArrayForTasks
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

- (id)cellsOutlineRed:(id)arg1 green:(id)arg2 blue:(id)arg3
{
    return nil;
}

- (id)cellsStyleMask
{
    return nil;
}

- (id)centerOfPriorityRange
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

- (id)clearPresentationDatasource
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

- (id)columnIndexesInRect:(NSRect)arg1
{
    return nil;
}

- (id)commitTransaction
{
    return nil;
}

- (id)computeRealDropIndexFromIndex:(id)arg1 takingInAccountHiddenItemsIndexes:(id)arg2
{
    return nil;
}

- (id)constrainsToOriginalSize
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

- (void)copy:(id)arg1
{

}

- (id)copyDataToPasteboard:(id)arg1 indexes:(id)arg2
{
    return nil;
}

- (id)createGenieWindowForBoundingBox:(id)arg1
{
    return nil;
}

- (id)currentEditor
{
    return nil;
}

- (void)cut:(id)arg1
{

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

- (id)defaultDoubleClickAction:(id)arg1
{
    return nil;
}

- (id)defaultHeightOfInfoSpaceWithCurrentViewOptions
{
    return nil;
}

- (id)defaultStringForStatusWithFileWeight:(id)arg1
{
    return nil;
}

- (id)delayedUpdateTrackingAreasAfterScrolling
{
    return nil;
}

- (id)delegatesImageManagementToDatasource
{
    return nil;
}

- (id)deleteSelection
{
    return nil;
}

- (id)didImportCell:(id)arg1 thumbnail:(id)arg2
{
    return nil;
}

- (id)didLooseFocus
{
    return nil;
}

- (id)directImportMode
{
    return nil;
}

- (id)disableTwoLineTitles
{
    return nil;
}

- (id)displayRolloverInlinePreviewForCellAtIndex:(id)arg1
{
    return nil;
}

- (id)documentVisibleRect
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

- (NSDragOperation)draggingSession:(id)arg1 sourceOperationMaskForDraggingContext:(NSDraggingContext)arg2
{
    return (NSDragOperation){0};
}

- (id)drawBackground:(id)arg1
{
    return nil;
}

- (id)drawBackgroundOverhangInRect:(id)arg1
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

- (id)drawDebugGrid
{
    return nil;
}

- (id)drawDebugSchedulePriorityRanges
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

- (id)drawDragBackground
{
    return nil;
}

- (id)drawDragOverlays
{
    return nil;
}

- (id)drawGrid
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

- (id)drawInlinePreview
{
    return nil;
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

- (id)drawSchedulePriorityRanges
{
    return nil;
}

- (id)drawSelectedItemsInGenieWindow:(id)arg1 withBoundingBox:(id)arg2
{
    return nil;
}

- (id)drawSelectionAndOverlays
{
    return nil;
}

- (id)drawSelectionFrame:(id)arg1
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

- (id)drawVisibleCells:(id)arg1
{
    return nil;
}

- (id)drawWithCurrentRendererInRect:(id)arg1
{
    return nil;
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

- (id)duplicate:(id)arg1
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

- (id)enableAutoAdaptativeQuality
{
    return nil;
}

- (id)enableDragFlocking
{
    return nil;
}

- (id)enableMagnification
{
    return nil;
}

- (id)enableMulticore
{
    return nil;
}

- (id)enablePrefetch
{
    return nil;
}

- (id)enableiOSGroupEditing
{
    return nil;
}

- (id)enclosingClipView
{
    return nil;
}

- (id)endPreviewPanelControl:(id)arg1
{
    return nil;
}

- (id)endSelectionProcess:(id)arg1
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

- (id)fetchThumbnailForCell:(id)arg1
{
    return nil;
}

- (id)finderMode
{
    return nil;
}

- (id)flavorAttributes
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

- (id)flushGLContext
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

- (id)fogShader
{
    return nil;
}

- (id)foregroundLayer
{
    return nil;
}

- (id)forwardEvent:(id)arg1 to:(id)arg2
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

- (id)freeTemporaryCacheProgress
{
    return nil;
}

- (id)genieEffectWithSelectionToScreenPosition:(id)arg1
{
    return nil;
}

- (id)getBezelGroup:(id)arg1 points:(id)arg2
{
    return nil;
}

- (id)getCountBadgeForCount:(id)arg1
{
    return nil;
}

- (id)getCurrentSelectionFrame
{
    return nil;
}

- (id)getDataSourceArray:(id)arg1
{
    return nil;
}

- (id)getGridCellFrame:(id)arg1 anchorPoint:(id)arg2 coordinates:(id)arg3 atPoint:(id)arg4 gridOffset:(id)arg5
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

- (id)graphicalSelectionFrame
{
    return nil;
}

- (id)grid
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

- (id)gridGroupFromDictionary:(id)arg1
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

- (id)gridVisibleRect
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

- (id)groupRangeAtLocationOfDroppedItem
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

- (id)hidePlayedInlinePreview
{
    return nil;
}

- (id)hideRolloverInlinePreview
{
    return nil;
}

- (id)horizontalScroller
{
    return nil;
}

- (id)iconImportDisabled
{
    return nil;
}

- (id)iconSize
{
    return nil;
}

- (id)ikSetNeedsDisplayInRect:(id)arg1
{
    return nil;
}

- (id)imageBoundingBoxSize
{
    return nil;
}

- (id)imageBrowserContext
{
    return nil;
}

- (id)imageBrowserFlavor
{
    return nil;
}

- (id)imageForRect:(id)arg1
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

- (id)importAllToIphoto
{
    return nil;
}

- (id)importCellSynchronously:(id)arg1
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

- (id)importVisibleCellsPriority
{
    return nil;
}

- (id)importVisibleCellsProgress
{
    return nil;
}

- (id)indexAtLocationOfDroppedItem
{
    return nil;
}

- (id)indexOfDraggedItem
{
    return nil;
}

- (id)indexOfGridGroup:(id)arg1
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

- (id)initProgressiveFocus:(id)arg1
{
    return nil;
}

- (id)initRenderingContext
{
    return nil;
}

- (id)initializeNewItem:(id)arg1
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

- (id)installCGOverlay:(id)arg1
{
    return nil;
}

- (id)installScrollValuesToScrollView:(id)arg1
{
    return nil;
}

- (id)installToolTips
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

- (id)invalidateFocusedIndex
{
    return nil;
}

- (id)invalidateLastSelectedIndex
{
    return nil;
}

- (id)invalidateSyncTaskCache
{
    return nil;
}

- (id)isAnimating
{
    return nil;
}

- (id)isBusyForTaskManager
{
    return nil;
}

- (id)isCellPartiallyObscuredAtIndex:(id)arg1 onlyTestImage:(id)arg2
{
    return nil;
}

- (id)isGroupExpandedAtIndex:(id)arg1
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

- (id)itemFrameAtIndex:(id)arg1
{
    return nil;
}

- (id)kvoContent
{
    return nil;
}

- (id)labelsOnRight
{
    return nil;
}

- (id)lastDiff
{
    return nil;
}

- (id)layoutManager
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

- (id)loadingFeedbackType
{
    return nil;
}

- (id)loadingProgressValue
{
    return nil;
}

- (id)loadingString
{
    return nil;
}

- (id)locationInView:(id)arg1 hitCellAtIndex:(id)arg2
{
    return nil;
}

- (id)magnifyer
{
    return nil;
}

- (id)maxIconSize
{
    return nil;
}

- (id)maximizedMode
{
    return nil;
}

- (id)mostCenteredImageIndex
{
    return nil;
}

- (id)mousePositionInView
{
    return nil;
}

- (id)namesOfPromisedFilesDroppedAtDestination:(id)arg1
{
    return nil;
}

- (id)needsToUpdatePreviewPanelFrame:(id)arg1
{
    return nil;
}

- (id)newCellForRepresentedItem:(id)arg1
{
    return nil;
}

- (id)nextIndexInFreeFormLayoutWithDirectionKey:(id)arg1 currentIndex:(id)arg2
{
    return nil;
}

- (id)nextIndexInGridLayoutWithDirectionKey:(id)arg1 currentIndex:(id)arg2
{
    return nil;
}

- (id)nicestRenderingDelay
{
    return nil;
}

- (id)nicestRenderingDoneAndUpdateInlinePreviewFrame:(id)arg1
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

- (id)notifyCellsForChanges:(id)arg1
{
    return nil;
}

- (id)numberOfColumns
{
    return nil;
}

- (id)numberOfPreviewItemsInPreviewPanel:(id)arg1
{
    return nil;
}

- (id)numberOfRows
{
    return nil;
}

- (id)numberOfSlideshowItems
{
    return nil;
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

- (id)openWithApplication:(id)arg1
{
    return nil;
}

- (id)openWithFinder:(id)arg1
{
    return nil;
}

- (id)openglSupportsRenderingInBounds:(id)arg1
{
    return nil;
}

- (id)outlinesCells
{
    return nil;
}

- (void)pageDown:(id)arg1
{

}

- (void)pageUp:(id)arg1
{

}

- (void)paste:(id)arg1
{

}

- (id)performRenderTimeLayoutModifiers:(id)arg1
{
    return nil;
}

- (id)performSynchronousTasksIfAny
{
    return nil;
}

- (id)pixelFormat
{
    return nil;
}

- (id)prepareEditingAtIndex:(id)arg1
{
    return nil;
}

- (void)prepareOpenGL
{

}

- (id)prepareThumbnailBuilderForCell:(id)arg1 size:(id)arg2 quality:(id)arg3
{
    return nil;
}

- (id)prepareThumbnailBuildersForCells:(id)arg1 size:(id)arg2 indexes:(id)arg3 quality:(id)arg4 rule:(id)arg5
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

- (NSRect)rectOfColumn:(NSInteger)arg1
{
    return (NSRect){0};
}

- (id)rectOfFloatingGroupHeader:(id)arg1
{
    return nil;
}

- (NSRect)rectOfRow:(NSInteger)arg1
{
    return (NSRect){0};
}

- (id)redisplay
{
    return nil;
}

- (id)refreshLoadingProgressBar
{
    return nil;
}

- (id)registerImageBrowserTasks
{
    return nil;
}

- (id)registerToNotifications
{
    return nil;
}

- (id)releaseRenderingContext
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

- (id)rememberForPreviousSelectedItem
{
    return nil;
}

- (void)remove:(id)arg1
{

}

- (id)removeAllCells
{
    return nil;
}

- (id)removeAllInlinePreviewTrackingAreasAndStopPlaying:(id)arg1
{
    return nil;
}

- (id)removeAllToolTipsIfNeeded
{
    return nil;
}

- (id)removeTrackingAreas
{
    return nil;
}

- (id)renderLevel
{
    return nil;
}

- (id)renderer
{
    return nil;
}

- (id)resetGroupsHorizontalOffset
{
    return nil;
}

- (id)resetSelectionIndexes
{
    return nil;
}

- (id)resetToDefaultRenderer
{
    return nil;
}

- (void)reshape
{

}

- (id)restartTasks
{
    return nil;
}

- (id)revealInFinder:(id)arg1
{
    return nil;
}

- (id)rolloverFrameForCellAtIndex:(id)arg1
{
    return nil;
}

- (id)rowIndexesInRect:(id)arg1
{
    return nil;
}

- (id)runFullPerformanceTest
{
    return nil;
}

- (id)schedulePriorityRange
{
    return nil;
}

- (id)scheduleProgress
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

- (id)scrollPrefetchTaskDelay
{
    return nil;
}

- (id)scrollPrefetchTaskProgress
{
    return nil;
}

- (id)scrollScreenBy:(id)arg1
{
    return nil;
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

- (id)scrollViewFrameDidChange:(id)arg1
{
    return nil;
}

- (id)scrollWheelMultiplier
{
    return nil;
}

- (id)scrollerDidChange:(id)arg1
{
    return nil;
}

- (id)secondsSinceTop:(id)arg1
{
    return nil;
}

- (void)selectAll:(id)arg1
{

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

- (id)selectionBoundingBox
{
    return nil;
}

- (id)selectionColor
{
    return nil;
}

- (id)selectionDidChange
{
    return nil;
}

- (id)selectionDidChangeForInlinePreview
{
    return nil;
}

- (id)selectionRed:(id)arg1 green:(id)arg2 blue:(id)arg3
{
    return nil;
}

- (id)selectionWillChange
{
    return nil;
}

- (void)setAllowsDropOnItems:(id)arg1
{

}

- (void)setAllowsDroppingOnItems:(id)arg1
{

}

- (void)setAllowsEmptySelection:(id)arg1
{

}

- (void)setAllowsReordering:(id)arg1
{

}

- (void)setAnimates:(id)arg1
{

}

- (void)setAnimationsMask:(id)arg1
{

}

- (void)setAppearanceStyle:(id)arg1
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

- (id)setBlinkingMode:(id)arg1 forCellAtIndex:(id)arg2
{
    return nil;
}

- (void)setCacheManager:(id)arg1
{

}

- (void)setCanControlQuickLookPanel:(id)arg1
{

}

- (void)setCellClass:(Class)arg1
{

}

- (void)setCellSize:(id)arg1
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

- (id)setClickableArea:(id)arg1 target:(id)arg2 selector:(id)arg3 info:(id)arg4
{
    return nil;
}

- (void)setConstrainsToOriginalSize:(id)arg1
{

}

- (void)setContentResizingMask:(id)arg1
{

}

- (void)setDelegatesImageManagementToDatasource:(id)arg1
{

}

- (void)setDirectImportMode:(id)arg1
{

}

- (void)setDisplayLoadingFrame:(id)arg1
{

}

- (void)setDragDestinationDelegate:(id)arg1
{

}

- (void)setDraggingDestinationDelegate:(id)arg1
{

}

- (void)setDrawGrid:(id)arg1
{

}

- (void)setDrawSchedulePriorityRanges:(id)arg1
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

- (void)setEnableAutoAdaptativeQuality:(id)arg1
{

}

- (void)setEnableDragFlocking:(id)arg1
{

}

- (void)setEnableMagnification:(id)arg1
{

}

- (void)setEnableMulticore:(id)arg1
{

}

- (void)setEnableNicestRendering:(id)arg1
{

}

- (void)setEnablePrefetch:(id)arg1
{

}

- (void)setEnableVMScheduler:(id)arg1
{

}

- (void)setEnableiOSGroupEditing:(id)arg1
{

}

- (void)setFinderMode:(id)arg1
{

}

- (void)setForegroundLayer:(id)arg1
{

}

- (void)setFreeFormLayoutMode:(id)arg1
{

}

- (id)setFreeFormLayoutMode:(id)arg1 animate:(id)arg2
{
    return nil;
}

- (void)setGLRendererEnabled:(id)arg1
{

}

- (void)setGridSpacing:(id)arg1
{

}

- (void)setHorizontalScroller:(id)arg1
{

}

- (void)setIconImportDisabled:(id)arg1
{

}

- (void)setIconSize:(id)arg1
{

}

- (void)setIconSizeFromCellSize:(id)arg1
{

}

- (void)setImageBoundingBoxSize:(id)arg1
{

}

- (void)setImageBrowserContext:(id)arg1
{

}

- (void)setImageBrowserFlavor:(id)arg1
{

}

- (void)setInlinePreviewEnabled:(id)arg1
{

}

- (void)setIntercellSpacing:(id)arg1
{

}

- (void)setIsDraggingOver:(id)arg1
{

}

- (void)setKVOContent:(id)arg1
{

}

- (void)setLabelsOnRight:(id)arg1
{

}

- (void)setLoadingFeedbackType:(id)arg1
{

}

- (void)setLoadingProgressValue:(id)arg1
{

}

- (void)setLoadingString:(id)arg1
{

}

- (void)setMaxIconSize:(id)arg1
{

}

- (void)setMaximizedMode:(id)arg1
{

}

- (void)setMouseTracker:(id)arg1
{

}

- (void)setNextFrameTime:(id)arg1
{

}

- (void)setOpenGLContext:(id)arg1
{

}

- (void)setOutlinesCells:(id)arg1
{

}

- (void)setPixelFormat:(id)arg1
{

}

- (void)setRenderLevel:(id)arg1
{

}

- (void)setRenderer:(id)arg1
{

}

- (void)setReordering:(id)arg1
{

}

- (void)setSelectedItemsHidden:(id)arg1
{

}

- (void)setSelectedItemsReordering:(id)arg1
{

}

- (void)setSelectionColor:(id)arg1
{

}

- (id)setSelectionIndexes:(id)arg1 byExtendingSelection:(id)arg2
{
    return nil;
}

- (void)setShadowsCells:(id)arg1
{

}

- (void)setSharingPreviewPanel:(id)arg1
{

}

- (void)setShowItemInfo:(id)arg1
{

}

- (void)setSpaceOutCellsAtDropLocation:(id)arg1
{

}

- (void)setSyncTasksMaxDelay:(id)arg1
{

}

- (void)setSyncTasksMaxInitialDelay:(id)arg1
{

}

- (void)setTextSize:(id)arg1
{

}

- (void)setTrackingOfRequestingViewsEnabled:(id)arg1
{

}

- (void)setUpdatesCGSurfaceOnDrawRect:(id)arg1
{

}

- (void)setVerticalScroller:(id)arg1
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

- (id)setupPresentationDatasource
{
    return nil;
}

- (id)setupRegisteredDraggedTypes
{
    return nil;
}

- (id)shadowsCells
{
    return nil;
}

- (id)sharingPreviewPanel
{
    return nil;
}

- (id)shouldAnimateAppearingAndDisappearingDatasourceItems
{
    return nil;
}

- (id)shouldBypassDrawingForCell:(id)arg1
{
    return nil;
}

- (id)shouldStartTaskNamed:(id)arg1
{
    return nil;
}

- (id)shouldUseXRayFolderForItemAtIndex:(id)arg1
{
    return nil;
}

- (id)showItemInfo
{
    return nil;
}

- (void)sizeToFit
{

}

- (id)sizeToFitWithGroups:(id)arg1 columns:(id)arg2
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

- (id)snapshotOfItemAtIndex:(id)arg1
{
    return nil;
}

- (id)spaceOutCellsAtDropLocation
{
    return nil;
}

- (id)spaceOutCellsForDropShouldReset:(id)arg1 animate:(id)arg2
{
    return nil;
}

- (id)startAutoscroll
{
    return nil;
}

- (id)startDragNDropWithEvent:(id)arg1
{
    return nil;
}

- (id)startDragNDropWithEvent:(id)arg1 itemIndexes:(id)arg2
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

- (id)startMagnifying:(id)arg1
{
    return nil;
}

- (id)startNicestRendering
{
    return nil;
}

- (id)startSchedule
{
    return nil;
}

- (id)startScrollPrefetchTask
{
    return nil;
}

- (id)startSelectionProcess:(id)arg1
{
    return nil;
}

- (id)startSlideShow:(id)arg1
{
    return nil;
}

- (id)startZoomPrefetchTask
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

- (id)stopAutoscroll
{
    return nil;
}

- (id)stopAutoscrollInGroup
{
    return nil;
}

- (id)stopEditing
{
    return nil;
}

- (id)stopMagnifying
{
    return nil;
}

- (id)stopiOSGroupEditingIfNeeded
{
    return nil;
}

- (id)superviewIsAClipView
{
    return nil;
}

- (id)supportGLRenderer
{
    return nil;
}

- (id)swapRolloverAndPlayedPreviewControllerIfNeededWhenUserStartsInlinePreview:(id)arg1
{
    return nil;
}

- (id)switchOffCARenderer
{
    return nil;
}

- (id)switchOnCARenderer
{
    return nil;
}

- (id)switchOnCARenderer:(id)arg1
{
    return nil;
}

- (id)syncTasksMaxDelay
{
    return nil;
}

- (id)syncTasksMaxInitialDelay
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

- (id)taskManager
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

- (id)threadedExecScript:(id)arg1
{
    return nil;
}

- (id)thumbnailImageAtIndex:(id)arg1
{
    return nil;
}

- (id)top
{
    return nil;
}

- (id)trackMouseEvent:(id)arg1
{
    return nil;
}

- (id)trackingOfRequestingViewsEnabled
{
    return nil;
}

- (id)translateAllCellsBy:(id)arg1
{
    return nil;
}

- (id)unfocusedSelectionColor
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

- (id)unsetupInlinePreview
{
    return nil;
}

- (void)update
{

}

- (id)updateCellSize
{
    return nil;
}

- (void)updateDraggingItemsForDrag:(id)arg1
{

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

- (id)updateGroups:(id)arg1
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

- (id)updateIntercellSpacingIfNeeded
{
    return nil;
}

- (id)updateItemList
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

- (id)updateMagnifying:(id)arg1
{
    return nil;
}

- (id)updateQuickLookPanelWithSelection
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

- (id)updateTitleEditingFrameIfNeeded
{
    return nil;
}

- (id)updateiOSGroupEditionWithDrag:(id)arg1 delayed:(id)arg2
{
    return nil;
}

- (id)updateiOSGroupMasterCells
{
    return nil;
}

- (id)updateiOSGroupOpenStateWithDrag:(id)arg1
{
    return nil;
}

- (id)updatesCGSurfaceOnDrawRect
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

- (id)validateFocusedIndex
{
    return nil;
}

- (BOOL)validateMenuItem:(id)arg1
{
    return (BOOL){0};
}

- (id)verticalScroller
{
    return nil;
}

- (id)view:(id)arg1 stringForToolTip:(NSToolTipTag)arg2 point:(NSPoint)arg3 userData:(void *)arg4
{
    return nil;
}

- (id)viewOffsetForCurrentClipRect
{
    return nil;
}

- (id)viewportRect
{
    return nil;
}

- (id)visibleCellIndexForPreviewItem:(id)arg1
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

- (id)vmScheduler
{
    return nil;
}

- (id)vmSchedulerEnabled
{
    return nil;
}

- (id)vramBindedRange
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

- (id)zoomValueDidChange
{
    return nil;
}
@end
