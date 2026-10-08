# Copyright (C) 2026, LibreDarwin
# SPDX-License-Identifier: BSD-3-Clause

CONFIG ?= release
SDK    ?= /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk
CC     := /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang

-include make/$(CONFIG).mk

BUILD_DIR := build/$(CONFIG)
OBJDIR    := $(BUILD_DIR)/obj

CFLAGS := $(OPT) -std=c11 -D_DARWIN_C_SOURCE -DIMAGEKIT_BUILDING_IMAGEKIT \
	-mmacosx-version-min=26.5 -isysroot "$(SDK)" -Isrc -I. -Wall -Wextra
MFLAGS := $(OPT) -fobjc-exceptions -fobjc-arc \
	-mmacosx-version-min=26.5 -isysroot "$(SDK)" -Isrc -I. -Wall -Wextra

FW_ID     := $(BUILD_DIR)/ImageKit.framework
FW_DYLIB  := $(FW_ID)/Versions/A/ImageKit
FW_HDRS   := IKImageView.h IKPrivateGraphics.h ImageKit.h ImageKitBase.h IKPictureTaker.h IKSlideshow.h IKImageBrowserView.h IKImageEditPanel.h IKFilterBrowserView.h IKFilterPanel.h IKSaveOptions.h IKPageLayout.h IKCacheManager.h IKFilterBrowserPanel.h IKScannerDeviceView.h IKCameraDeviceView.h IKDeviceBrowserView.h IKImageBrowserCell.h IKFilterUIView.h IKFilterUI.h
FW_HDR_DEPS := src/IKImageView.h src/IKPrivateGraphics.h src/ImageKit.h src/ImageKitBase.h src/IKPictureTaker.h src/IKSlideshow.h src/IKImageBrowserView.h src/IKImageEditPanel.h src/IKFilterBrowserView.h src/IKFilterPanel.h src/IKSaveOptions.h src/IKPageLayout.h src/IKCacheManager.h src/IKFilterBrowserPanel.h src/IKScannerDeviceView.h src/IKCameraDeviceView.h src/IKDeviceBrowserView.h src/IKImageBrowserCell.h src/IKFilterUIView.h src/IKFilterUI.h

OBJS := $(OBJDIR)/IK2PartVertical.o $(OBJDIR)/IK3PartHorizontal.o $(OBJDIR)/IKAccessoryView.o $(OBJDIR)/IKAccessoryViewController.o $(OBJDIR)/IKAdjustSlider.o $(OBJDIR)/IKAnimationData.o $(OBJDIR)/IKAnimationGroup.o $(OBJDIR)/IKAnimationManager.o $(OBJDIR)/IKAnnotation.o $(OBJDIR)/IKAnnotationLayer.o $(OBJDIR)/IKAnnotationPanel.o $(OBJDIR)/IKAppKitTextDriver.o $(OBJDIR)/IKArrowAnnotation.o $(OBJDIR)/IKAutoDetection.o $(OBJDIR)/IKAutodetectedItem.o $(OBJDIR)/IKAutolayoutImageView.o $(OBJDIR)/IKBookletCell.o $(OBJDIR)/IKBookletPlasticCover.o $(OBJDIR)/IKBorderedView.o $(OBJDIR)/IKBox.o $(OBJDIR)/IKCGRenderer.o $(OBJDIR)/IKCIFilterCorrection.o $(OBJDIR)/IKCacheContext.o $(OBJDIR)/IKCacheData.o $(OBJDIR)/IKCacheDatabase.o $(OBJDIR)/IKCacheDatabaseEntry.o $(OBJDIR)/IKCacheDatabaseUIDInfo.o $(OBJDIR)/IKCacheFragHandler.o $(OBJDIR)/IKCacheFragHandlerView.o $(OBJDIR)/IKCacheFragHandler_Hole.o $(OBJDIR)/IKCacheManager.o $(OBJDIR)/IKCacheManagerRegistry.o $(OBJDIR)/IKCacheNode.o $(OBJDIR)/IKCacheRamNode.o $(OBJDIR)/IKCacheTimeOutLauncher.o $(OBJDIR)/IKCacheVRamNode.o $(OBJDIR)/IKCameraBackgroundView.o $(OBJDIR)/IKCameraCollectionViewItem.o $(OBJDIR)/IKCameraDeviceView.o $(OBJDIR)/IKCameraDeviceViewHandler.o $(OBJDIR)/IKCameraDeviceViewHandlerIB.o $(OBJDIR)/IKCameraDownloader.o $(OBJDIR)/IKCameraFolderWatcher.o $(OBJDIR)/IKCameraIconCellView.o $(OBJDIR)/IKCameraItem.o $(OBJDIR)/IKCameraServices.o $(OBJDIR)/IKCameraTableView.o $(OBJDIR)/IKCenteredLayer.o $(OBJDIR)/IKCenteringClipView.o $(OBJDIR)/IKCircleAnnotation.o $(OBJDIR)/IKCircleSelection.o $(OBJDIR)/IKCollageCell.o $(OBJDIR)/IKColor.o $(OBJDIR)/IKColorValueTransformer.o $(OBJDIR)/IKColorView.o $(OBJDIR)/IKComposer.o $(OBJDIR)/IKCropLayer.o $(OBJDIR)/IKCropRectSelection.o $(OBJDIR)/IKCustomPathPopupButton.o $(OBJDIR)/IKDVGrabber.o $(OBJDIR)/IKDatasourceDiff.o $(OBJDIR)/IKDatasourceDiffResult.o $(OBJDIR)/IKDatasourceProxy.o $(OBJDIR)/IKDeviceBrowserDataView.o $(OBJDIR)/IKDeviceBrowserHandler.o $(OBJDIR)/IKDeviceBrowserHandlerIB.o $(OBJDIR)/IKDeviceBrowserHeaderView.o $(OBJDIR)/IKDeviceBrowserOutlineView.o $(OBJDIR)/IKDeviceBrowserView.o $(OBJDIR)/IKDeviceItem.o $(OBJDIR)/IKDrawing.o $(OBJDIR)/IKEmbeddedImageEditToolbar.o $(OBJDIR)/IKEmbeddedImageView.o $(OBJDIR)/IKFSEvent.o $(OBJDIR)/IKFilterBrowserPanel.o $(OBJDIR)/IKFilterBrowserView.o $(OBJDIR)/IKFilterChain.o $(OBJDIR)/IKFilterPanel.o $(OBJDIR)/IKFilterPreviewView.o $(OBJDIR)/IKFilterUI.o $(OBJDIR)/IKFilterUIView.o $(OBJDIR)/IKFinderCell.o $(OBJDIR)/IKFinderReflectiveIconCell.o $(OBJDIR)/IKFinderStackIconCell.o $(OBJDIR)/IKFlippedView.o $(OBJDIR)/IKFlockingDatasourceItem.o $(OBJDIR)/IKGLLayer.o $(OBJDIR)/IKGLScroller.o $(OBJDIR)/IKGLSharedContextRegistry.o $(OBJDIR)/IKGLTextCache.o $(OBJDIR)/IKGLTextCacheFragHandler.o $(OBJDIR)/IKGLTextGenerator.o $(OBJDIR)/IKGLTextInfo.o $(OBJDIR)/IKGLTextRenderer.o $(OBJDIR)/IKGLTextSizeCache.o $(OBJDIR)/IKGLTextSubpixelShader.o $(OBJDIR)/IKGradientHorizontalSeparatorGrooved.o $(OBJDIR)/IKGradientHorizontalSeparatorTapered.o $(OBJDIR)/IKGradientImageButton.o $(OBJDIR)/IKGradientImageButtonCell.o $(OBJDIR)/IKGraySlider.o $(OBJDIR)/IKGraySliderCell.o $(OBJDIR)/IKGuidesLayer.o $(OBJDIR)/IKHardwareCapsChangeNotifier.o $(OBJDIR)/IKHierarchicalDatasourceAdaptor.o $(OBJDIR)/IKICInfoHandler.o $(OBJDIR)/IKIMGPreviewCell.o $(OBJDIR)/IKIconCell.o $(OBJDIR)/IKIconDatabase.o $(OBJDIR)/IKImageAdjust.o $(OBJDIR)/IKImageAdjustSlider.o $(OBJDIR)/IKImageAdjustSliderCell.o $(OBJDIR)/IKImageAdjustView.o $(OBJDIR)/IKImageAnalysisManager.o $(OBJDIR)/IKImageBackgroundLayer.o $(OBJDIR)/IKImageBackgroundThumbnailMaskLayer.o $(OBJDIR)/IKImageBannerView.o $(OBJDIR)/IKImageBlockLayer.o $(OBJDIR)/IKImageBrowserAccessibilityCell.o $(OBJDIR)/IKImageBrowserAppearAnimation.o $(OBJDIR)/IKImageBrowserBookletGrid.o $(OBJDIR)/IKImageBrowserCell.o $(OBJDIR)/IKImageBrowserCellOffscreenRenderer.o $(OBJDIR)/IKImageBrowserCoverFlowGrid.o $(OBJDIR)/IKImageBrowserCoverFlowIntertiaAnimation.o $(OBJDIR)/IKImageBrowserCoverFlowScrollingAnimation.o $(OBJDIR)/IKImageBrowserDisappearAnimation.o $(OBJDIR)/IKImageBrowserExpandCollapseGroupAnimation.o $(OBJDIR)/IKImageBrowserExpandCollapseItemsAnimation.o $(OBJDIR)/IKImageBrowserExpandCollapseiOSGroupAnimation.o $(OBJDIR)/IKImageBrowserFloatingGroupGrid.o $(OBJDIR)/IKImageBrowserFreeFormLayout.o $(OBJDIR)/IKImageBrowserFreezeAnimation.o $(OBJDIR)/IKImageBrowserGenieEffectManager.o $(OBJDIR)/IKImageBrowserGenieView.o $(OBJDIR)/IKImageBrowserGenieWindow.o $(OBJDIR)/IKImageBrowserGrid.o $(OBJDIR)/IKImageBrowserGridGroup.o $(OBJDIR)/IKImageBrowserImportAnimation.o $(OBJDIR)/IKImageBrowserLayoutManager.o $(OBJDIR)/IKImageBrowserMagnifying.o $(OBJDIR)/IKImageBrowserReorderAnimation.o $(OBJDIR)/IKImageBrowserScrollAnimation.o $(OBJDIR)/IKImageBrowserSubsetLayoutManager.o $(OBJDIR)/IKImageBrowserVMScheduler.o $(OBJDIR)/IKImageBrowserView.o $(OBJDIR)/IKImageBrowseriOSGroupDimCellsAnimation.o $(OBJDIR)/IKImageBrowseriOSGroupGrid.o $(OBJDIR)/IKImageBrowseriOSGroupHighlightCellAnimation.o $(OBJDIR)/IKImageCell.o $(OBJDIR)/IKImageCellDatasourceProxy.o $(OBJDIR)/IKImageCellReservedIvars.o $(OBJDIR)/IKImageCellTrackingViewDatasourceProxy.o $(OBJDIR)/IKImageClipView.o $(OBJDIR)/IKImageContentView.o $(OBJDIR)/IKImageCorrection.o $(OBJDIR)/IKImageCorrectionHandler.o $(OBJDIR)/IKImageCropPRS.o $(OBJDIR)/IKImageCropView.o $(OBJDIR)/IKImageCropViewEffect.o $(OBJDIR)/IKImageCropViewSlider.o $(OBJDIR)/IKImageEditDSHandler.o $(OBJDIR)/IKImageEditFrame.o $(OBJDIR)/IKImageEditFrameToolbar.o $(OBJDIR)/IKImageEditPanel.o $(OBJDIR)/IKImageEditPanelButton.o $(OBJDIR)/IKImageEditPanelController.o $(OBJDIR)/IKImageEditPanelPrivateData.o $(OBJDIR)/IKImageEditView.o $(OBJDIR)/IKImageEditWorldMap.o $(OBJDIR)/IKImageEditWorldMapOld.o $(OBJDIR)/IKImageEffects.o $(OBJDIR)/IKImageEffectsView.o $(OBJDIR)/IKImageFlowAccessibilityCell.o $(OBJDIR)/IKImageFlowAccessibilityList.o $(OBJDIR)/IKImageFlowAppearAnimation.o $(OBJDIR)/IKImageFlowCell.o $(OBJDIR)/IKImageFlowDisappearAnimation.o $(OBJDIR)/IKImageFlowFlipAnimation.o $(OBJDIR)/IKImageFlowImportAnimation.o $(OBJDIR)/IKImageFlowScrollingAnimation.o $(OBJDIR)/IKImageFlowView.o $(OBJDIR)/IKImageGridItem.o $(OBJDIR)/IKImageHistogram.o $(OBJDIR)/IKImageInfo.o $(OBJDIR)/IKImageInfoView.o $(OBJDIR)/IKImageLayer.o $(OBJDIR)/IKImagePasteboardLayer.o $(OBJDIR)/IKImagePicker.o $(OBJDIR)/IKImageRenderInfo.o $(OBJDIR)/IKImageState.o $(OBJDIR)/IKImageTextureRange.o $(OBJDIR)/IKImageView.o $(OBJDIR)/IKImageView2.o $(OBJDIR)/IKImageView2ScrollView.o $(OBJDIR)/IKImageViewLayerQueue.o $(OBJDIR)/IKImageViewPrivateData.o $(OBJDIR)/IKImageViewUtils.o $(OBJDIR)/IKImageWrapper.o $(OBJDIR)/IKImageWrapperAnimatedGifCache.o $(OBJDIR)/IKInfoTabView.o $(OBJDIR)/IKInterfaceBuilderImage.o $(OBJDIR)/IKInterfaceBuilderSharedDatasource.o $(OBJDIR)/IKInterfaceBuilderSharedDelegate.o $(OBJDIR)/IKIrisListener.o $(OBJDIR)/IKKnob.o $(OBJDIR)/IKKnobLayer.o $(OBJDIR)/IKLassoSelection.o $(OBJDIR)/IKLayerRenderer.o $(OBJDIR)/IKLinkedList.o $(OBJDIR)/IKLinkedListLink.o $(OBJDIR)/IKLinkedListNode.o $(OBJDIR)/IKLinkedListNodePool.o $(OBJDIR)/IKMediaPlugin.o $(OBJDIR)/IKMetadataHandler.o $(OBJDIR)/IKMipmapImage.o $(OBJDIR)/IKMipmapItem.o $(OBJDIR)/IKMonitorBrightnessController.o $(OBJDIR)/IKMultipleSegmentedRawDataBuffer.o $(OBJDIR)/IKNAnnotation.o $(OBJDIR)/IKNCustomLayer.o $(OBJDIR)/IKNImageLayer.o $(OBJDIR)/IKNImageView.o $(OBJDIR)/IKNImageViewHandler.o $(OBJDIR)/IKNKnobsLayer.o $(OBJDIR)/IKNProgressLayer.o $(OBJDIR)/IKNRootLayer.o $(OBJDIR)/IKNSelection.o $(OBJDIR)/IKNStatusRoot.o $(OBJDIR)/IKNStatusView.o $(OBJDIR)/IKNStatusView2.o $(OBJDIR)/IKNavigationImageLayer.o $(OBJDIR)/IKNavigationLayer.o $(OBJDIR)/IKNavigationRectLayer.o $(OBJDIR)/IKNoActionShapeLayer.o $(OBJDIR)/IKOpenGLRenderer.o $(OBJDIR)/IKOpenGLRoundedRectRenderer.o $(OBJDIR)/IKOpenGLRoundedRectRendererCache.o $(OBJDIR)/IKPBNotePlayer.o $(OBJDIR)/IKPPFloatingWindow.o $(OBJDIR)/IKPPFloatingWindowAnimation.o $(OBJDIR)/IKPTCropView.o $(OBJDIR)/IKPTImageGridCell.o $(OBJDIR)/IKPTImageGridView.o $(OBJDIR)/IKPTImageViewForAnimation.o $(OBJDIR)/IKPageLayout.o $(OBJDIR)/IKPastedImage.o $(OBJDIR)/IKPathPopupButton.o $(OBJDIR)/IKPathToCIImageValueTransformer.o $(OBJDIR)/IKPictureTaker.o $(OBJDIR)/IKPictureTakerController.o $(OBJDIR)/IKPictureTakerCropView.o $(OBJDIR)/IKPictureTakerRecentPicture.o $(OBJDIR)/IKPictureTakerRecentPictureRepository.o $(OBJDIR)/IKPlaceholderItem.o $(OBJDIR)/IKPlaceholderLayer.o $(OBJDIR)/IKPrivateGraphics.o $(OBJDIR)/IKProKitCell.o $(OBJDIR)/IKProfilePictureRolloverLayer.o $(OBJDIR)/IKProfilePictureView.o $(OBJDIR)/IKRadianToDegreeValueTransformer.o $(OBJDIR)/IKRamManager.o $(OBJDIR)/IKRangeFormatter.o $(OBJDIR)/IKRectAnnotation.o $(OBJDIR)/IKRectSelection.o $(OBJDIR)/IKRectSelectionImageCapture.o $(OBJDIR)/IKRectanglePacker.o $(OBJDIR)/IKReflectionCell.o $(OBJDIR)/IKReflectiveIconCell.o $(OBJDIR)/IKRootLayer.o $(OBJDIR)/IKRootLayout.o $(OBJDIR)/IKRotationLayer.o $(OBJDIR)/IKSFCropElement.o $(OBJDIR)/IKSFEffectDescription.o $(OBJDIR)/IKSFElement.o $(OBJDIR)/IKSSBackgroundImageView.o $(OBJDIR)/IKSSBackgroundWindow.o $(OBJDIR)/IKSSButton.o $(OBJDIR)/IKSSContentLayer.o $(OBJDIR)/IKSSEventLessLayer.o $(OBJDIR)/IKSSGradientLayer.o $(OBJDIR)/IKSSImageView.o $(OBJDIR)/IKSSIndexHandler.o $(OBJDIR)/IKSSIndexSheetSelectionLayer.o $(OBJDIR)/IKSSIndexSheetTextLayer.o $(OBJDIR)/IKSSIndexView.o $(OBJDIR)/IKSSPDFView.o $(OBJDIR)/IKSSPanel.o $(OBJDIR)/IKSSThumbnailLayer.o $(OBJDIR)/IKSSToolTip.o $(OBJDIR)/IKSSToolTipView.o $(OBJDIR)/IKSaveOptions.o $(OBJDIR)/IKSaveOptionsHandler.o $(OBJDIR)/IKScan.o $(OBJDIR)/IKScanArea.o $(OBJDIR)/IKScanInfo.o $(OBJDIR)/IKScanResult.o $(OBJDIR)/IKScanResultsHandler.o $(OBJDIR)/IKScanResultsTextCellView.o $(OBJDIR)/IKScanUIController.o $(OBJDIR)/IKScanUIControllerAdvanced.o $(OBJDIR)/IKScanUIControllerSimple.o $(OBJDIR)/IKScanUIViewAdvanced.o $(OBJDIR)/IKScanUIViewSimple.o $(OBJDIR)/IKScannerDeviceView.o $(OBJDIR)/IKScannerDeviceViewHandler.o $(OBJDIR)/IKScannerDeviceViewHandlerIB.o $(OBJDIR)/IKScannerNoDeviceView.o $(OBJDIR)/IKScannerParameterView.o $(OBJDIR)/IKScannerPreviewAdvanced.o $(OBJDIR)/IKScannerPreviewSimple.o $(OBJDIR)/IKScannerSelfTest.o $(OBJDIR)/IKSegmentedRawDataBuffer.o $(OBJDIR)/IKSelection.o $(OBJDIR)/IKSelectionLayer.o $(OBJDIR)/IKSelfTestHandler.o $(OBJDIR)/IKShadowTool.o $(OBJDIR)/IKSlideshow.o

PREFIX  ?= /usr/local
DESTDIR ?=

all: $(FW_DYLIB)

$(FW_DYLIB): $(OBJS)
	@rm -rf $(FW_ID)
	@mkdir -p $(FW_ID)/Versions/A/Headers
	@mkdir -p $(FW_ID)/Versions/A/Resources
	@ln -s A $(FW_ID)/Versions/Current
	@ln -s Versions/Current/Headers $(FW_ID)/Headers
	@ln -s Versions/Current/Resources $(FW_ID)/Resources
	@ln -s Versions/Current/ImageKit $(FW_ID)/ImageKit
	@cp $(FW_HDR_DEPS) $(FW_ID)/Versions/A/Headers/
	@cp src/version.plist $(FW_ID)/Versions/A/Resources/ 2>/dev/null || true
	@cp src/Info.plist $(FW_ID)/Versions/A/Resources/ 2>/dev/null || true
	$(CC) $(MFLAGS) -dynamiclib -o $@ $(OBJS) \
		-install_name @rpath/ImageKit.framework/Versions/A/ImageKit \
		-compatibility_version 1.0.0 -current_version 1.0.0 \
		-framework AppKit -framework CoreGraphics -framework QuartzCore \
		-framework Foundation -lz -lbz2

$(OBJDIR)/IKImageView.o: src/IKImageView.m src/IKImageView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageView.m

$(OBJDIR)/IKPrivateGraphics.o: src/IKPrivateGraphics.m src/IKPrivateGraphics.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKPrivateGraphics.m

$(OBJDIR)/IKCacheManager.o: src/IKCacheManager.m src/IKCacheManager.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCacheManager.m
$(OBJDIR)/IKFilterBrowserView.o: src/IKFilterBrowserView.m src/IKFilterBrowserView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKFilterBrowserView.m
$(OBJDIR)/IKFilterPanel.o: src/IKFilterPanel.m src/IKFilterPanel.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKFilterPanel.m
$(OBJDIR)/IKImageBrowserView.o: src/IKImageBrowserView.m src/IKImageBrowserView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageBrowserView.m
$(OBJDIR)/IKImageEditPanel.o: src/IKImageEditPanel.m src/IKImageEditPanel.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageEditPanel.m
$(OBJDIR)/IKPageLayout.o: src/IKPageLayout.m src/IKPageLayout.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKPageLayout.m
$(OBJDIR)/IKPictureTaker.o: src/IKPictureTaker.m src/IKPictureTaker.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKPictureTaker.m
$(OBJDIR)/IKSaveOptions.o: src/IKSaveOptions.m src/IKSaveOptions.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKSaveOptions.m
$(OBJDIR)/IKSlideshow.o: src/IKSlideshow.m src/IKSlideshow.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKSlideshow.m

$(OBJDIR)/IKDeviceBrowserView.o: src/IKDeviceBrowserView.m src/IKDeviceBrowserView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKDeviceBrowserView.m
$(OBJDIR)/IKCameraDeviceView.o: src/IKCameraDeviceView.m src/IKCameraDeviceView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCameraDeviceView.m
$(OBJDIR)/IKScannerDeviceView.o: src/IKScannerDeviceView.m src/IKScannerDeviceView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKScannerDeviceView.m
$(OBJDIR)/IKFilterBrowserPanel.o: src/IKFilterBrowserPanel.m src/IKFilterBrowserPanel.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKFilterBrowserPanel.m

$(OBJDIR)/IKFilterUI.o: src/IKFilterUI.m src/IKFilterUI.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKFilterUI.m
$(OBJDIR)/IKFilterUIView.o: src/IKFilterUIView.m src/IKFilterUIView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKFilterUIView.m
$(OBJDIR)/IKImageBrowserCell.o: src/IKImageBrowserCell.m src/IKImageBrowserCell.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageBrowserCell.m

$(OBJDIR)/IK2PartVertical.o: src/IK2PartVertical.m src/IK2PartVertical.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IK2PartVertical.m
$(OBJDIR)/IK3PartHorizontal.o: src/IK3PartHorizontal.m src/IK3PartHorizontal.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IK3PartHorizontal.m
$(OBJDIR)/IKAccessoryView.o: src/IKAccessoryView.m src/IKAccessoryView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAccessoryView.m
$(OBJDIR)/IKAccessoryViewController.o: src/IKAccessoryViewController.m src/IKAccessoryViewController.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAccessoryViewController.m
$(OBJDIR)/IKAdjustSlider.o: src/IKAdjustSlider.m src/IKAdjustSlider.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAdjustSlider.m
$(OBJDIR)/IKAnimationData.o: src/IKAnimationData.m src/IKAnimationData.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAnimationData.m
$(OBJDIR)/IKAnimationGroup.o: src/IKAnimationGroup.m src/IKAnimationGroup.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAnimationGroup.m
$(OBJDIR)/IKAnimationManager.o: src/IKAnimationManager.m src/IKAnimationManager.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAnimationManager.m
$(OBJDIR)/IKAnnotation.o: src/IKAnnotation.m src/IKAnnotation.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAnnotation.m
$(OBJDIR)/IKAnnotationLayer.o: src/IKAnnotationLayer.m src/IKAnnotationLayer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAnnotationLayer.m
$(OBJDIR)/IKAnnotationPanel.o: src/IKAnnotationPanel.m src/IKAnnotationPanel.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAnnotationPanel.m
$(OBJDIR)/IKAppKitTextDriver.o: src/IKAppKitTextDriver.m src/IKAppKitTextDriver.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAppKitTextDriver.m
$(OBJDIR)/IKArrowAnnotation.o: src/IKArrowAnnotation.m src/IKArrowAnnotation.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKArrowAnnotation.m
$(OBJDIR)/IKAutoDetection.o: src/IKAutoDetection.m src/IKAutoDetection.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAutoDetection.m
$(OBJDIR)/IKAutodetectedItem.o: src/IKAutodetectedItem.m src/IKAutodetectedItem.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAutodetectedItem.m
$(OBJDIR)/IKAutolayoutImageView.o: src/IKAutolayoutImageView.m src/IKAutolayoutImageView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAutolayoutImageView.m
$(OBJDIR)/IKBookletCell.o: src/IKBookletCell.m src/IKBookletCell.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKBookletCell.m
$(OBJDIR)/IKBookletPlasticCover.o: src/IKBookletPlasticCover.m src/IKBookletPlasticCover.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKBookletPlasticCover.m
$(OBJDIR)/IKBorderedView.o: src/IKBorderedView.m src/IKBorderedView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKBorderedView.m
$(OBJDIR)/IKBox.o: src/IKBox.m src/IKBox.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKBox.m
$(OBJDIR)/IKCacheManager.o: src/IKCacheManager.m src/IKCacheManager.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCacheManager.m
$(OBJDIR)/IKCameraDeviceView.o: src/IKCameraDeviceView.m src/IKCameraDeviceView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCameraDeviceView.m
$(OBJDIR)/IKDeviceBrowserView.o: src/IKDeviceBrowserView.m src/IKDeviceBrowserView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKDeviceBrowserView.m
$(OBJDIR)/IKFilterBrowserPanel.o: src/IKFilterBrowserPanel.m src/IKFilterBrowserPanel.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKFilterBrowserPanel.m
$(OBJDIR)/IKFilterBrowserView.o: src/IKFilterBrowserView.m src/IKFilterBrowserView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKFilterBrowserView.m
$(OBJDIR)/IKFilterPanel.o: src/IKFilterPanel.m src/IKFilterPanel.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKFilterPanel.m
$(OBJDIR)/IKFilterUI.o: src/IKFilterUI.m src/IKFilterUI.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKFilterUI.m
$(OBJDIR)/IKFilterUIView.o: src/IKFilterUIView.m src/IKFilterUIView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKFilterUIView.m
$(OBJDIR)/IKImageBrowserCell.o: src/IKImageBrowserCell.m src/IKImageBrowserCell.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageBrowserCell.m
$(OBJDIR)/IKImageBrowserView.o: src/IKImageBrowserView.m src/IKImageBrowserView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageBrowserView.m
$(OBJDIR)/IKImageEditPanel.o: src/IKImageEditPanel.m src/IKImageEditPanel.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageEditPanel.m
$(OBJDIR)/IKImageView.o: src/IKImageView.m src/IKImageView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageView.m
$(OBJDIR)/IKPageLayout.o: src/IKPageLayout.m src/IKPageLayout.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKPageLayout.m
$(OBJDIR)/IKPictureTaker.o: src/IKPictureTaker.m src/IKPictureTaker.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKPictureTaker.m
$(OBJDIR)/IKPrivateGraphics.o: src/IKPrivateGraphics.m src/IKPrivateGraphics.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKPrivateGraphics.m
$(OBJDIR)/IKSaveOptions.o: src/IKSaveOptions.m src/IKSaveOptions.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKSaveOptions.m
$(OBJDIR)/IKScannerDeviceView.o: src/IKScannerDeviceView.m src/IKScannerDeviceView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKScannerDeviceView.m
$(OBJDIR)/IKSlideshow.o: src/IKSlideshow.m src/IKSlideshow.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKSlideshow.m

$(OBJDIR)/IK2PartVertical.o: src/IK2PartVertical.m src/IK2PartVertical.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IK2PartVertical.m
$(OBJDIR)/IK3PartHorizontal.o: src/IK3PartHorizontal.m src/IK3PartHorizontal.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IK3PartHorizontal.m
$(OBJDIR)/IKAccessoryView.o: src/IKAccessoryView.m src/IKAccessoryView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAccessoryView.m
$(OBJDIR)/IKAccessoryViewController.o: src/IKAccessoryViewController.m src/IKAccessoryViewController.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAccessoryViewController.m
$(OBJDIR)/IKAdjustSlider.o: src/IKAdjustSlider.m src/IKAdjustSlider.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAdjustSlider.m
$(OBJDIR)/IKAnimationData.o: src/IKAnimationData.m src/IKAnimationData.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAnimationData.m
$(OBJDIR)/IKAnimationGroup.o: src/IKAnimationGroup.m src/IKAnimationGroup.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAnimationGroup.m
$(OBJDIR)/IKAnimationManager.o: src/IKAnimationManager.m src/IKAnimationManager.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAnimationManager.m
$(OBJDIR)/IKAnnotation.o: src/IKAnnotation.m src/IKAnnotation.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAnnotation.m
$(OBJDIR)/IKAnnotationLayer.o: src/IKAnnotationLayer.m src/IKAnnotationLayer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAnnotationLayer.m
$(OBJDIR)/IKAnnotationPanel.o: src/IKAnnotationPanel.m src/IKAnnotationPanel.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAnnotationPanel.m
$(OBJDIR)/IKAppKitTextDriver.o: src/IKAppKitTextDriver.m src/IKAppKitTextDriver.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAppKitTextDriver.m
$(OBJDIR)/IKArrowAnnotation.o: src/IKArrowAnnotation.m src/IKArrowAnnotation.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKArrowAnnotation.m
$(OBJDIR)/IKAutoDetection.o: src/IKAutoDetection.m src/IKAutoDetection.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAutoDetection.m
$(OBJDIR)/IKAutodetectedItem.o: src/IKAutodetectedItem.m src/IKAutodetectedItem.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAutodetectedItem.m
$(OBJDIR)/IKAutolayoutImageView.o: src/IKAutolayoutImageView.m src/IKAutolayoutImageView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAutolayoutImageView.m
$(OBJDIR)/IKBookletCell.o: src/IKBookletCell.m src/IKBookletCell.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKBookletCell.m
$(OBJDIR)/IKBookletPlasticCover.o: src/IKBookletPlasticCover.m src/IKBookletPlasticCover.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKBookletPlasticCover.m
$(OBJDIR)/IKBorderedView.o: src/IKBorderedView.m src/IKBorderedView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKBorderedView.m
$(OBJDIR)/IKBox.o: src/IKBox.m src/IKBox.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKBox.m
$(OBJDIR)/IKCGRenderer.o: src/IKCGRenderer.m src/IKCGRenderer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCGRenderer.m
$(OBJDIR)/IKCIFilterCorrection.o: src/IKCIFilterCorrection.m src/IKCIFilterCorrection.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCIFilterCorrection.m
$(OBJDIR)/IKCacheContext.o: src/IKCacheContext.m src/IKCacheContext.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCacheContext.m
$(OBJDIR)/IKCacheData.o: src/IKCacheData.m src/IKCacheData.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCacheData.m
$(OBJDIR)/IKCacheDatabase.o: src/IKCacheDatabase.m src/IKCacheDatabase.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCacheDatabase.m
$(OBJDIR)/IKCacheDatabaseEntry.o: src/IKCacheDatabaseEntry.m src/IKCacheDatabaseEntry.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCacheDatabaseEntry.m
$(OBJDIR)/IKCacheDatabaseUIDInfo.o: src/IKCacheDatabaseUIDInfo.m src/IKCacheDatabaseUIDInfo.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCacheDatabaseUIDInfo.m
$(OBJDIR)/IKCacheFragHandler.o: src/IKCacheFragHandler.m src/IKCacheFragHandler.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCacheFragHandler.m
$(OBJDIR)/IKCacheFragHandlerView.o: src/IKCacheFragHandlerView.m src/IKCacheFragHandlerView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCacheFragHandlerView.m
$(OBJDIR)/IKCacheFragHandler_Hole.o: src/IKCacheFragHandler_Hole.m src/IKCacheFragHandler_Hole.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCacheFragHandler_Hole.m
$(OBJDIR)/IKCacheManager.o: src/IKCacheManager.m src/IKCacheManager.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCacheManager.m
$(OBJDIR)/IKCacheManagerRegistry.o: src/IKCacheManagerRegistry.m src/IKCacheManagerRegistry.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCacheManagerRegistry.m
$(OBJDIR)/IKCacheNode.o: src/IKCacheNode.m src/IKCacheNode.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCacheNode.m
$(OBJDIR)/IKCacheRamNode.o: src/IKCacheRamNode.m src/IKCacheRamNode.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCacheRamNode.m
$(OBJDIR)/IKCacheTimeOutLauncher.o: src/IKCacheTimeOutLauncher.m src/IKCacheTimeOutLauncher.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCacheTimeOutLauncher.m
$(OBJDIR)/IKCacheVRamNode.o: src/IKCacheVRamNode.m src/IKCacheVRamNode.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCacheVRamNode.m
$(OBJDIR)/IKCameraBackgroundView.o: src/IKCameraBackgroundView.m src/IKCameraBackgroundView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCameraBackgroundView.m
$(OBJDIR)/IKCameraCollectionViewItem.o: src/IKCameraCollectionViewItem.m src/IKCameraCollectionViewItem.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCameraCollectionViewItem.m
$(OBJDIR)/IKCameraDeviceView.o: src/IKCameraDeviceView.m src/IKCameraDeviceView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCameraDeviceView.m
$(OBJDIR)/IKCameraDeviceViewHandler.o: src/IKCameraDeviceViewHandler.m src/IKCameraDeviceViewHandler.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCameraDeviceViewHandler.m
$(OBJDIR)/IKCameraDeviceViewHandlerIB.o: src/IKCameraDeviceViewHandlerIB.m src/IKCameraDeviceViewHandlerIB.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCameraDeviceViewHandlerIB.m
$(OBJDIR)/IKCameraDownloader.o: src/IKCameraDownloader.m src/IKCameraDownloader.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCameraDownloader.m
$(OBJDIR)/IKCameraFolderWatcher.o: src/IKCameraFolderWatcher.m src/IKCameraFolderWatcher.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCameraFolderWatcher.m
$(OBJDIR)/IKCameraIconCellView.o: src/IKCameraIconCellView.m src/IKCameraIconCellView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCameraIconCellView.m
$(OBJDIR)/IKCameraItem.o: src/IKCameraItem.m src/IKCameraItem.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCameraItem.m
$(OBJDIR)/IKCameraServices.o: src/IKCameraServices.m src/IKCameraServices.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCameraServices.m
$(OBJDIR)/IKCameraTableView.o: src/IKCameraTableView.m src/IKCameraTableView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCameraTableView.m
$(OBJDIR)/IKCenteredLayer.o: src/IKCenteredLayer.m src/IKCenteredLayer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCenteredLayer.m
$(OBJDIR)/IKCenteringClipView.o: src/IKCenteringClipView.m src/IKCenteringClipView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCenteringClipView.m
$(OBJDIR)/IKCircleAnnotation.o: src/IKCircleAnnotation.m src/IKCircleAnnotation.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCircleAnnotation.m
$(OBJDIR)/IKCircleSelection.o: src/IKCircleSelection.m src/IKCircleSelection.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCircleSelection.m
$(OBJDIR)/IKCollageCell.o: src/IKCollageCell.m src/IKCollageCell.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCollageCell.m
$(OBJDIR)/IKDeviceBrowserView.o: src/IKDeviceBrowserView.m src/IKDeviceBrowserView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKDeviceBrowserView.m
$(OBJDIR)/IKFilterBrowserPanel.o: src/IKFilterBrowserPanel.m src/IKFilterBrowserPanel.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKFilterBrowserPanel.m
$(OBJDIR)/IKFilterBrowserView.o: src/IKFilterBrowserView.m src/IKFilterBrowserView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKFilterBrowserView.m
$(OBJDIR)/IKFilterPanel.o: src/IKFilterPanel.m src/IKFilterPanel.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKFilterPanel.m
$(OBJDIR)/IKFilterUI.o: src/IKFilterUI.m src/IKFilterUI.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKFilterUI.m
$(OBJDIR)/IKFilterUIView.o: src/IKFilterUIView.m src/IKFilterUIView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKFilterUIView.m
$(OBJDIR)/IKImageBrowserCell.o: src/IKImageBrowserCell.m src/IKImageBrowserCell.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageBrowserCell.m
$(OBJDIR)/IKImageBrowserView.o: src/IKImageBrowserView.m src/IKImageBrowserView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageBrowserView.m
$(OBJDIR)/IKImageEditPanel.o: src/IKImageEditPanel.m src/IKImageEditPanel.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageEditPanel.m
$(OBJDIR)/IKImageView.o: src/IKImageView.m src/IKImageView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageView.m
$(OBJDIR)/IKPageLayout.o: src/IKPageLayout.m src/IKPageLayout.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKPageLayout.m
$(OBJDIR)/IKPictureTaker.o: src/IKPictureTaker.m src/IKPictureTaker.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKPictureTaker.m
$(OBJDIR)/IKPrivateGraphics.o: src/IKPrivateGraphics.m src/IKPrivateGraphics.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKPrivateGraphics.m
$(OBJDIR)/IKSaveOptions.o: src/IKSaveOptions.m src/IKSaveOptions.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKSaveOptions.m
$(OBJDIR)/IKScannerDeviceView.o: src/IKScannerDeviceView.m src/IKScannerDeviceView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKScannerDeviceView.m
$(OBJDIR)/IKSlideshow.o: src/IKSlideshow.m src/IKSlideshow.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKSlideshow.m

$(OBJDIR)/IK2PartVertical.o: src/IK2PartVertical.m src/IK2PartVertical.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IK2PartVertical.m
$(OBJDIR)/IK3PartHorizontal.o: src/IK3PartHorizontal.m src/IK3PartHorizontal.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IK3PartHorizontal.m
$(OBJDIR)/IKAccessoryView.o: src/IKAccessoryView.m src/IKAccessoryView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAccessoryView.m
$(OBJDIR)/IKAccessoryViewController.o: src/IKAccessoryViewController.m src/IKAccessoryViewController.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAccessoryViewController.m
$(OBJDIR)/IKAdjustSlider.o: src/IKAdjustSlider.m src/IKAdjustSlider.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAdjustSlider.m
$(OBJDIR)/IKAnimationData.o: src/IKAnimationData.m src/IKAnimationData.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAnimationData.m
$(OBJDIR)/IKAnimationGroup.o: src/IKAnimationGroup.m src/IKAnimationGroup.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAnimationGroup.m
$(OBJDIR)/IKAnimationManager.o: src/IKAnimationManager.m src/IKAnimationManager.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAnimationManager.m
$(OBJDIR)/IKAnnotation.o: src/IKAnnotation.m src/IKAnnotation.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAnnotation.m
$(OBJDIR)/IKAnnotationLayer.o: src/IKAnnotationLayer.m src/IKAnnotationLayer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAnnotationLayer.m
$(OBJDIR)/IKAnnotationPanel.o: src/IKAnnotationPanel.m src/IKAnnotationPanel.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAnnotationPanel.m
$(OBJDIR)/IKAppKitTextDriver.o: src/IKAppKitTextDriver.m src/IKAppKitTextDriver.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAppKitTextDriver.m
$(OBJDIR)/IKArrowAnnotation.o: src/IKArrowAnnotation.m src/IKArrowAnnotation.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKArrowAnnotation.m
$(OBJDIR)/IKAutoDetection.o: src/IKAutoDetection.m src/IKAutoDetection.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAutoDetection.m
$(OBJDIR)/IKAutodetectedItem.o: src/IKAutodetectedItem.m src/IKAutodetectedItem.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAutodetectedItem.m
$(OBJDIR)/IKAutolayoutImageView.o: src/IKAutolayoutImageView.m src/IKAutolayoutImageView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAutolayoutImageView.m
$(OBJDIR)/IKBookletCell.o: src/IKBookletCell.m src/IKBookletCell.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKBookletCell.m
$(OBJDIR)/IKBookletPlasticCover.o: src/IKBookletPlasticCover.m src/IKBookletPlasticCover.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKBookletPlasticCover.m
$(OBJDIR)/IKBorderedView.o: src/IKBorderedView.m src/IKBorderedView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKBorderedView.m
$(OBJDIR)/IKBox.o: src/IKBox.m src/IKBox.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKBox.m
$(OBJDIR)/IKCGRenderer.o: src/IKCGRenderer.m src/IKCGRenderer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCGRenderer.m
$(OBJDIR)/IKCIFilterCorrection.o: src/IKCIFilterCorrection.m src/IKCIFilterCorrection.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCIFilterCorrection.m
$(OBJDIR)/IKCacheContext.o: src/IKCacheContext.m src/IKCacheContext.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCacheContext.m
$(OBJDIR)/IKCacheData.o: src/IKCacheData.m src/IKCacheData.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCacheData.m
$(OBJDIR)/IKCacheDatabase.o: src/IKCacheDatabase.m src/IKCacheDatabase.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCacheDatabase.m
$(OBJDIR)/IKCacheDatabaseEntry.o: src/IKCacheDatabaseEntry.m src/IKCacheDatabaseEntry.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCacheDatabaseEntry.m
$(OBJDIR)/IKCacheDatabaseUIDInfo.o: src/IKCacheDatabaseUIDInfo.m src/IKCacheDatabaseUIDInfo.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCacheDatabaseUIDInfo.m
$(OBJDIR)/IKCacheFragHandler.o: src/IKCacheFragHandler.m src/IKCacheFragHandler.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCacheFragHandler.m
$(OBJDIR)/IKCacheFragHandlerView.o: src/IKCacheFragHandlerView.m src/IKCacheFragHandlerView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCacheFragHandlerView.m
$(OBJDIR)/IKCacheFragHandler_Hole.o: src/IKCacheFragHandler_Hole.m src/IKCacheFragHandler_Hole.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCacheFragHandler_Hole.m
$(OBJDIR)/IKCacheManager.o: src/IKCacheManager.m src/IKCacheManager.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCacheManager.m
$(OBJDIR)/IKCacheManagerRegistry.o: src/IKCacheManagerRegistry.m src/IKCacheManagerRegistry.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCacheManagerRegistry.m
$(OBJDIR)/IKCacheNode.o: src/IKCacheNode.m src/IKCacheNode.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCacheNode.m
$(OBJDIR)/IKCacheRamNode.o: src/IKCacheRamNode.m src/IKCacheRamNode.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCacheRamNode.m
$(OBJDIR)/IKCacheTimeOutLauncher.o: src/IKCacheTimeOutLauncher.m src/IKCacheTimeOutLauncher.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCacheTimeOutLauncher.m
$(OBJDIR)/IKCacheVRamNode.o: src/IKCacheVRamNode.m src/IKCacheVRamNode.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCacheVRamNode.m
$(OBJDIR)/IKCameraBackgroundView.o: src/IKCameraBackgroundView.m src/IKCameraBackgroundView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCameraBackgroundView.m
$(OBJDIR)/IKCameraCollectionViewItem.o: src/IKCameraCollectionViewItem.m src/IKCameraCollectionViewItem.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCameraCollectionViewItem.m
$(OBJDIR)/IKCameraDeviceView.o: src/IKCameraDeviceView.m src/IKCameraDeviceView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCameraDeviceView.m
$(OBJDIR)/IKCameraDeviceViewHandler.o: src/IKCameraDeviceViewHandler.m src/IKCameraDeviceViewHandler.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCameraDeviceViewHandler.m
$(OBJDIR)/IKCameraDeviceViewHandlerIB.o: src/IKCameraDeviceViewHandlerIB.m src/IKCameraDeviceViewHandlerIB.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCameraDeviceViewHandlerIB.m
$(OBJDIR)/IKCameraDownloader.o: src/IKCameraDownloader.m src/IKCameraDownloader.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCameraDownloader.m
$(OBJDIR)/IKCameraFolderWatcher.o: src/IKCameraFolderWatcher.m src/IKCameraFolderWatcher.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCameraFolderWatcher.m
$(OBJDIR)/IKCameraIconCellView.o: src/IKCameraIconCellView.m src/IKCameraIconCellView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCameraIconCellView.m
$(OBJDIR)/IKCameraItem.o: src/IKCameraItem.m src/IKCameraItem.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCameraItem.m
$(OBJDIR)/IKCameraServices.o: src/IKCameraServices.m src/IKCameraServices.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCameraServices.m
$(OBJDIR)/IKCameraTableView.o: src/IKCameraTableView.m src/IKCameraTableView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCameraTableView.m
$(OBJDIR)/IKCenteredLayer.o: src/IKCenteredLayer.m src/IKCenteredLayer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCenteredLayer.m
$(OBJDIR)/IKCenteringClipView.o: src/IKCenteringClipView.m src/IKCenteringClipView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCenteringClipView.m
$(OBJDIR)/IKCircleAnnotation.o: src/IKCircleAnnotation.m src/IKCircleAnnotation.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCircleAnnotation.m
$(OBJDIR)/IKCircleSelection.o: src/IKCircleSelection.m src/IKCircleSelection.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCircleSelection.m
$(OBJDIR)/IKCollageCell.o: src/IKCollageCell.m src/IKCollageCell.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCollageCell.m
$(OBJDIR)/IKColor.o: src/IKColor.m src/IKColor.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKColor.m
$(OBJDIR)/IKColorValueTransformer.o: src/IKColorValueTransformer.m src/IKColorValueTransformer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKColorValueTransformer.m
$(OBJDIR)/IKColorView.o: src/IKColorView.m src/IKColorView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKColorView.m
$(OBJDIR)/IKComposer.o: src/IKComposer.m src/IKComposer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKComposer.m
$(OBJDIR)/IKCropLayer.o: src/IKCropLayer.m src/IKCropLayer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCropLayer.m
$(OBJDIR)/IKCropRectSelection.o: src/IKCropRectSelection.m src/IKCropRectSelection.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCropRectSelection.m
$(OBJDIR)/IKCustomPathPopupButton.o: src/IKCustomPathPopupButton.m src/IKCustomPathPopupButton.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCustomPathPopupButton.m
$(OBJDIR)/IKDVGrabber.o: src/IKDVGrabber.m src/IKDVGrabber.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKDVGrabber.m
$(OBJDIR)/IKDatasourceDiff.o: src/IKDatasourceDiff.m src/IKDatasourceDiff.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKDatasourceDiff.m
$(OBJDIR)/IKDatasourceDiffResult.o: src/IKDatasourceDiffResult.m src/IKDatasourceDiffResult.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKDatasourceDiffResult.m
$(OBJDIR)/IKDatasourceProxy.o: src/IKDatasourceProxy.m src/IKDatasourceProxy.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKDatasourceProxy.m
$(OBJDIR)/IKDeviceBrowserDataView.o: src/IKDeviceBrowserDataView.m src/IKDeviceBrowserDataView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKDeviceBrowserDataView.m
$(OBJDIR)/IKDeviceBrowserHandler.o: src/IKDeviceBrowserHandler.m src/IKDeviceBrowserHandler.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKDeviceBrowserHandler.m
$(OBJDIR)/IKDeviceBrowserHandlerIB.o: src/IKDeviceBrowserHandlerIB.m src/IKDeviceBrowserHandlerIB.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKDeviceBrowserHandlerIB.m
$(OBJDIR)/IKDeviceBrowserHeaderView.o: src/IKDeviceBrowserHeaderView.m src/IKDeviceBrowserHeaderView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKDeviceBrowserHeaderView.m
$(OBJDIR)/IKDeviceBrowserOutlineView.o: src/IKDeviceBrowserOutlineView.m src/IKDeviceBrowserOutlineView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKDeviceBrowserOutlineView.m
$(OBJDIR)/IKDeviceBrowserView.o: src/IKDeviceBrowserView.m src/IKDeviceBrowserView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKDeviceBrowserView.m
$(OBJDIR)/IKDeviceItem.o: src/IKDeviceItem.m src/IKDeviceItem.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKDeviceItem.m
$(OBJDIR)/IKDrawing.o: src/IKDrawing.m src/IKDrawing.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKDrawing.m
$(OBJDIR)/IKEmbeddedImageEditToolbar.o: src/IKEmbeddedImageEditToolbar.m src/IKEmbeddedImageEditToolbar.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKEmbeddedImageEditToolbar.m
$(OBJDIR)/IKEmbeddedImageView.o: src/IKEmbeddedImageView.m src/IKEmbeddedImageView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKEmbeddedImageView.m
$(OBJDIR)/IKFSEvent.o: src/IKFSEvent.m src/IKFSEvent.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKFSEvent.m
$(OBJDIR)/IKFilterBrowserPanel.o: src/IKFilterBrowserPanel.m src/IKFilterBrowserPanel.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKFilterBrowserPanel.m
$(OBJDIR)/IKFilterBrowserView.o: src/IKFilterBrowserView.m src/IKFilterBrowserView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKFilterBrowserView.m
$(OBJDIR)/IKFilterChain.o: src/IKFilterChain.m src/IKFilterChain.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKFilterChain.m
$(OBJDIR)/IKFilterPanel.o: src/IKFilterPanel.m src/IKFilterPanel.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKFilterPanel.m
$(OBJDIR)/IKFilterPreviewView.o: src/IKFilterPreviewView.m src/IKFilterPreviewView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKFilterPreviewView.m
$(OBJDIR)/IKFilterUI.o: src/IKFilterUI.m src/IKFilterUI.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKFilterUI.m
$(OBJDIR)/IKFilterUIView.o: src/IKFilterUIView.m src/IKFilterUIView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKFilterUIView.m
$(OBJDIR)/IKFinderCell.o: src/IKFinderCell.m src/IKFinderCell.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKFinderCell.m
$(OBJDIR)/IKFinderReflectiveIconCell.o: src/IKFinderReflectiveIconCell.m src/IKFinderReflectiveIconCell.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKFinderReflectiveIconCell.m
$(OBJDIR)/IKFinderStackIconCell.o: src/IKFinderStackIconCell.m src/IKFinderStackIconCell.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKFinderStackIconCell.m
$(OBJDIR)/IKFlippedView.o: src/IKFlippedView.m src/IKFlippedView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKFlippedView.m
$(OBJDIR)/IKFlockingDatasourceItem.o: src/IKFlockingDatasourceItem.m src/IKFlockingDatasourceItem.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKFlockingDatasourceItem.m
$(OBJDIR)/IKGLLayer.o: src/IKGLLayer.m src/IKGLLayer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKGLLayer.m
$(OBJDIR)/IKGLScroller.o: src/IKGLScroller.m src/IKGLScroller.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKGLScroller.m
$(OBJDIR)/IKGLSharedContextRegistry.o: src/IKGLSharedContextRegistry.m src/IKGLSharedContextRegistry.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKGLSharedContextRegistry.m
$(OBJDIR)/IKGLTextCache.o: src/IKGLTextCache.m src/IKGLTextCache.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKGLTextCache.m
$(OBJDIR)/IKGLTextCacheFragHandler.o: src/IKGLTextCacheFragHandler.m src/IKGLTextCacheFragHandler.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKGLTextCacheFragHandler.m
$(OBJDIR)/IKGLTextGenerator.o: src/IKGLTextGenerator.m src/IKGLTextGenerator.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKGLTextGenerator.m
$(OBJDIR)/IKGLTextInfo.o: src/IKGLTextInfo.m src/IKGLTextInfo.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKGLTextInfo.m
$(OBJDIR)/IKGLTextRenderer.o: src/IKGLTextRenderer.m src/IKGLTextRenderer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKGLTextRenderer.m
$(OBJDIR)/IKGLTextSizeCache.o: src/IKGLTextSizeCache.m src/IKGLTextSizeCache.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKGLTextSizeCache.m
$(OBJDIR)/IKGLTextSubpixelShader.o: src/IKGLTextSubpixelShader.m src/IKGLTextSubpixelShader.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKGLTextSubpixelShader.m
$(OBJDIR)/IKGradientHorizontalSeparatorGrooved.o: src/IKGradientHorizontalSeparatorGrooved.m src/IKGradientHorizontalSeparatorGrooved.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKGradientHorizontalSeparatorGrooved.m
$(OBJDIR)/IKGradientHorizontalSeparatorTapered.o: src/IKGradientHorizontalSeparatorTapered.m src/IKGradientHorizontalSeparatorTapered.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKGradientHorizontalSeparatorTapered.m
$(OBJDIR)/IKGradientImageButton.o: src/IKGradientImageButton.m src/IKGradientImageButton.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKGradientImageButton.m
$(OBJDIR)/IKGradientImageButtonCell.o: src/IKGradientImageButtonCell.m src/IKGradientImageButtonCell.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKGradientImageButtonCell.m
$(OBJDIR)/IKGraySlider.o: src/IKGraySlider.m src/IKGraySlider.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKGraySlider.m
$(OBJDIR)/IKGraySliderCell.o: src/IKGraySliderCell.m src/IKGraySliderCell.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKGraySliderCell.m
$(OBJDIR)/IKGuidesLayer.o: src/IKGuidesLayer.m src/IKGuidesLayer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKGuidesLayer.m
$(OBJDIR)/IKHardwareCapsChangeNotifier.o: src/IKHardwareCapsChangeNotifier.m src/IKHardwareCapsChangeNotifier.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKHardwareCapsChangeNotifier.m
$(OBJDIR)/IKHierarchicalDatasourceAdaptor.o: src/IKHierarchicalDatasourceAdaptor.m src/IKHierarchicalDatasourceAdaptor.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKHierarchicalDatasourceAdaptor.m
$(OBJDIR)/IKICInfoHandler.o: src/IKICInfoHandler.m src/IKICInfoHandler.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKICInfoHandler.m
$(OBJDIR)/IKIMGPreviewCell.o: src/IKIMGPreviewCell.m src/IKIMGPreviewCell.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKIMGPreviewCell.m
$(OBJDIR)/IKIconCell.o: src/IKIconCell.m src/IKIconCell.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKIconCell.m
$(OBJDIR)/IKImageBrowserCell.o: src/IKImageBrowserCell.m src/IKImageBrowserCell.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageBrowserCell.m
$(OBJDIR)/IKImageBrowserView.o: src/IKImageBrowserView.m src/IKImageBrowserView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageBrowserView.m
$(OBJDIR)/IKImageEditPanel.o: src/IKImageEditPanel.m src/IKImageEditPanel.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageEditPanel.m
$(OBJDIR)/IKImageView.o: src/IKImageView.m src/IKImageView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageView.m
$(OBJDIR)/IKPageLayout.o: src/IKPageLayout.m src/IKPageLayout.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKPageLayout.m
$(OBJDIR)/IKPictureTaker.o: src/IKPictureTaker.m src/IKPictureTaker.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKPictureTaker.m
$(OBJDIR)/IKPrivateGraphics.o: src/IKPrivateGraphics.m src/IKPrivateGraphics.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKPrivateGraphics.m
$(OBJDIR)/IKSaveOptions.o: src/IKSaveOptions.m src/IKSaveOptions.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKSaveOptions.m
$(OBJDIR)/IKScannerDeviceView.o: src/IKScannerDeviceView.m src/IKScannerDeviceView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKScannerDeviceView.m
$(OBJDIR)/IKSlideshow.o: src/IKSlideshow.m src/IKSlideshow.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKSlideshow.m

$(OBJDIR)/IK2PartVertical.o: src/IK2PartVertical.m src/IK2PartVertical.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IK2PartVertical.m
$(OBJDIR)/IK3PartHorizontal.o: src/IK3PartHorizontal.m src/IK3PartHorizontal.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IK3PartHorizontal.m
$(OBJDIR)/IKAccessoryView.o: src/IKAccessoryView.m src/IKAccessoryView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAccessoryView.m
$(OBJDIR)/IKAccessoryViewController.o: src/IKAccessoryViewController.m src/IKAccessoryViewController.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAccessoryViewController.m
$(OBJDIR)/IKAdjustSlider.o: src/IKAdjustSlider.m src/IKAdjustSlider.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAdjustSlider.m
$(OBJDIR)/IKAnimationData.o: src/IKAnimationData.m src/IKAnimationData.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAnimationData.m
$(OBJDIR)/IKAnimationGroup.o: src/IKAnimationGroup.m src/IKAnimationGroup.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAnimationGroup.m
$(OBJDIR)/IKAnimationManager.o: src/IKAnimationManager.m src/IKAnimationManager.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAnimationManager.m
$(OBJDIR)/IKAnnotation.o: src/IKAnnotation.m src/IKAnnotation.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAnnotation.m
$(OBJDIR)/IKAnnotationLayer.o: src/IKAnnotationLayer.m src/IKAnnotationLayer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAnnotationLayer.m
$(OBJDIR)/IKAnnotationPanel.o: src/IKAnnotationPanel.m src/IKAnnotationPanel.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAnnotationPanel.m
$(OBJDIR)/IKAppKitTextDriver.o: src/IKAppKitTextDriver.m src/IKAppKitTextDriver.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAppKitTextDriver.m
$(OBJDIR)/IKArrowAnnotation.o: src/IKArrowAnnotation.m src/IKArrowAnnotation.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKArrowAnnotation.m
$(OBJDIR)/IKAutoDetection.o: src/IKAutoDetection.m src/IKAutoDetection.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAutoDetection.m
$(OBJDIR)/IKAutodetectedItem.o: src/IKAutodetectedItem.m src/IKAutodetectedItem.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAutodetectedItem.m
$(OBJDIR)/IKAutolayoutImageView.o: src/IKAutolayoutImageView.m src/IKAutolayoutImageView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKAutolayoutImageView.m
$(OBJDIR)/IKBookletCell.o: src/IKBookletCell.m src/IKBookletCell.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKBookletCell.m
$(OBJDIR)/IKBookletPlasticCover.o: src/IKBookletPlasticCover.m src/IKBookletPlasticCover.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKBookletPlasticCover.m
$(OBJDIR)/IKBorderedView.o: src/IKBorderedView.m src/IKBorderedView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKBorderedView.m
$(OBJDIR)/IKBox.o: src/IKBox.m src/IKBox.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKBox.m
$(OBJDIR)/IKCGRenderer.o: src/IKCGRenderer.m src/IKCGRenderer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCGRenderer.m
$(OBJDIR)/IKCIFilterCorrection.o: src/IKCIFilterCorrection.m src/IKCIFilterCorrection.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCIFilterCorrection.m
$(OBJDIR)/IKCacheContext.o: src/IKCacheContext.m src/IKCacheContext.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCacheContext.m
$(OBJDIR)/IKCacheData.o: src/IKCacheData.m src/IKCacheData.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCacheData.m
$(OBJDIR)/IKCacheDatabase.o: src/IKCacheDatabase.m src/IKCacheDatabase.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCacheDatabase.m
$(OBJDIR)/IKCacheDatabaseEntry.o: src/IKCacheDatabaseEntry.m src/IKCacheDatabaseEntry.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCacheDatabaseEntry.m
$(OBJDIR)/IKCacheDatabaseUIDInfo.o: src/IKCacheDatabaseUIDInfo.m src/IKCacheDatabaseUIDInfo.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCacheDatabaseUIDInfo.m
$(OBJDIR)/IKCacheFragHandler.o: src/IKCacheFragHandler.m src/IKCacheFragHandler.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCacheFragHandler.m
$(OBJDIR)/IKCacheFragHandlerView.o: src/IKCacheFragHandlerView.m src/IKCacheFragHandlerView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCacheFragHandlerView.m
$(OBJDIR)/IKCacheFragHandler_Hole.o: src/IKCacheFragHandler_Hole.m src/IKCacheFragHandler_Hole.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCacheFragHandler_Hole.m
$(OBJDIR)/IKCacheManager.o: src/IKCacheManager.m src/IKCacheManager.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCacheManager.m
$(OBJDIR)/IKCacheManagerRegistry.o: src/IKCacheManagerRegistry.m src/IKCacheManagerRegistry.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCacheManagerRegistry.m
$(OBJDIR)/IKCacheNode.o: src/IKCacheNode.m src/IKCacheNode.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCacheNode.m
$(OBJDIR)/IKCacheRamNode.o: src/IKCacheRamNode.m src/IKCacheRamNode.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCacheRamNode.m
$(OBJDIR)/IKCacheTimeOutLauncher.o: src/IKCacheTimeOutLauncher.m src/IKCacheTimeOutLauncher.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCacheTimeOutLauncher.m
$(OBJDIR)/IKCacheVRamNode.o: src/IKCacheVRamNode.m src/IKCacheVRamNode.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCacheVRamNode.m
$(OBJDIR)/IKCameraBackgroundView.o: src/IKCameraBackgroundView.m src/IKCameraBackgroundView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCameraBackgroundView.m
$(OBJDIR)/IKCameraCollectionViewItem.o: src/IKCameraCollectionViewItem.m src/IKCameraCollectionViewItem.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCameraCollectionViewItem.m
$(OBJDIR)/IKCameraDeviceView.o: src/IKCameraDeviceView.m src/IKCameraDeviceView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCameraDeviceView.m
$(OBJDIR)/IKCameraDeviceViewHandler.o: src/IKCameraDeviceViewHandler.m src/IKCameraDeviceViewHandler.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCameraDeviceViewHandler.m
$(OBJDIR)/IKCameraDeviceViewHandlerIB.o: src/IKCameraDeviceViewHandlerIB.m src/IKCameraDeviceViewHandlerIB.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCameraDeviceViewHandlerIB.m
$(OBJDIR)/IKCameraDownloader.o: src/IKCameraDownloader.m src/IKCameraDownloader.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCameraDownloader.m
$(OBJDIR)/IKCameraFolderWatcher.o: src/IKCameraFolderWatcher.m src/IKCameraFolderWatcher.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCameraFolderWatcher.m
$(OBJDIR)/IKCameraIconCellView.o: src/IKCameraIconCellView.m src/IKCameraIconCellView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCameraIconCellView.m
$(OBJDIR)/IKCameraItem.o: src/IKCameraItem.m src/IKCameraItem.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCameraItem.m
$(OBJDIR)/IKCameraServices.o: src/IKCameraServices.m src/IKCameraServices.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCameraServices.m
$(OBJDIR)/IKCameraTableView.o: src/IKCameraTableView.m src/IKCameraTableView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCameraTableView.m
$(OBJDIR)/IKCenteredLayer.o: src/IKCenteredLayer.m src/IKCenteredLayer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCenteredLayer.m
$(OBJDIR)/IKCenteringClipView.o: src/IKCenteringClipView.m src/IKCenteringClipView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCenteringClipView.m
$(OBJDIR)/IKCircleAnnotation.o: src/IKCircleAnnotation.m src/IKCircleAnnotation.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCircleAnnotation.m
$(OBJDIR)/IKCircleSelection.o: src/IKCircleSelection.m src/IKCircleSelection.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCircleSelection.m
$(OBJDIR)/IKCollageCell.o: src/IKCollageCell.m src/IKCollageCell.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCollageCell.m
$(OBJDIR)/IKColor.o: src/IKColor.m src/IKColor.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKColor.m
$(OBJDIR)/IKColorValueTransformer.o: src/IKColorValueTransformer.m src/IKColorValueTransformer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKColorValueTransformer.m
$(OBJDIR)/IKColorView.o: src/IKColorView.m src/IKColorView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKColorView.m
$(OBJDIR)/IKComposer.o: src/IKComposer.m src/IKComposer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKComposer.m
$(OBJDIR)/IKCropLayer.o: src/IKCropLayer.m src/IKCropLayer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCropLayer.m
$(OBJDIR)/IKCropRectSelection.o: src/IKCropRectSelection.m src/IKCropRectSelection.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCropRectSelection.m
$(OBJDIR)/IKCustomPathPopupButton.o: src/IKCustomPathPopupButton.m src/IKCustomPathPopupButton.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKCustomPathPopupButton.m
$(OBJDIR)/IKDVGrabber.o: src/IKDVGrabber.m src/IKDVGrabber.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKDVGrabber.m
$(OBJDIR)/IKDatasourceDiff.o: src/IKDatasourceDiff.m src/IKDatasourceDiff.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKDatasourceDiff.m
$(OBJDIR)/IKDatasourceDiffResult.o: src/IKDatasourceDiffResult.m src/IKDatasourceDiffResult.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKDatasourceDiffResult.m
$(OBJDIR)/IKDatasourceProxy.o: src/IKDatasourceProxy.m src/IKDatasourceProxy.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKDatasourceProxy.m
$(OBJDIR)/IKDeviceBrowserDataView.o: src/IKDeviceBrowserDataView.m src/IKDeviceBrowserDataView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKDeviceBrowserDataView.m
$(OBJDIR)/IKDeviceBrowserHandler.o: src/IKDeviceBrowserHandler.m src/IKDeviceBrowserHandler.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKDeviceBrowserHandler.m
$(OBJDIR)/IKDeviceBrowserHandlerIB.o: src/IKDeviceBrowserHandlerIB.m src/IKDeviceBrowserHandlerIB.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKDeviceBrowserHandlerIB.m
$(OBJDIR)/IKDeviceBrowserHeaderView.o: src/IKDeviceBrowserHeaderView.m src/IKDeviceBrowserHeaderView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKDeviceBrowserHeaderView.m
$(OBJDIR)/IKDeviceBrowserOutlineView.o: src/IKDeviceBrowserOutlineView.m src/IKDeviceBrowserOutlineView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKDeviceBrowserOutlineView.m
$(OBJDIR)/IKDeviceBrowserView.o: src/IKDeviceBrowserView.m src/IKDeviceBrowserView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKDeviceBrowserView.m
$(OBJDIR)/IKDeviceItem.o: src/IKDeviceItem.m src/IKDeviceItem.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKDeviceItem.m
$(OBJDIR)/IKDrawing.o: src/IKDrawing.m src/IKDrawing.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKDrawing.m
$(OBJDIR)/IKEmbeddedImageEditToolbar.o: src/IKEmbeddedImageEditToolbar.m src/IKEmbeddedImageEditToolbar.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKEmbeddedImageEditToolbar.m
$(OBJDIR)/IKEmbeddedImageView.o: src/IKEmbeddedImageView.m src/IKEmbeddedImageView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKEmbeddedImageView.m
$(OBJDIR)/IKFSEvent.o: src/IKFSEvent.m src/IKFSEvent.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKFSEvent.m
$(OBJDIR)/IKFilterBrowserPanel.o: src/IKFilterBrowserPanel.m src/IKFilterBrowserPanel.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKFilterBrowserPanel.m
$(OBJDIR)/IKFilterBrowserView.o: src/IKFilterBrowserView.m src/IKFilterBrowserView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKFilterBrowserView.m
$(OBJDIR)/IKFilterChain.o: src/IKFilterChain.m src/IKFilterChain.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKFilterChain.m
$(OBJDIR)/IKFilterPanel.o: src/IKFilterPanel.m src/IKFilterPanel.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKFilterPanel.m
$(OBJDIR)/IKFilterPreviewView.o: src/IKFilterPreviewView.m src/IKFilterPreviewView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKFilterPreviewView.m
$(OBJDIR)/IKFilterUI.o: src/IKFilterUI.m src/IKFilterUI.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKFilterUI.m
$(OBJDIR)/IKFilterUIView.o: src/IKFilterUIView.m src/IKFilterUIView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKFilterUIView.m
$(OBJDIR)/IKFinderCell.o: src/IKFinderCell.m src/IKFinderCell.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKFinderCell.m
$(OBJDIR)/IKFinderReflectiveIconCell.o: src/IKFinderReflectiveIconCell.m src/IKFinderReflectiveIconCell.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKFinderReflectiveIconCell.m
$(OBJDIR)/IKFinderStackIconCell.o: src/IKFinderStackIconCell.m src/IKFinderStackIconCell.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKFinderStackIconCell.m
$(OBJDIR)/IKFlippedView.o: src/IKFlippedView.m src/IKFlippedView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKFlippedView.m
$(OBJDIR)/IKFlockingDatasourceItem.o: src/IKFlockingDatasourceItem.m src/IKFlockingDatasourceItem.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKFlockingDatasourceItem.m
$(OBJDIR)/IKGLLayer.o: src/IKGLLayer.m src/IKGLLayer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKGLLayer.m
$(OBJDIR)/IKGLScroller.o: src/IKGLScroller.m src/IKGLScroller.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKGLScroller.m
$(OBJDIR)/IKGLSharedContextRegistry.o: src/IKGLSharedContextRegistry.m src/IKGLSharedContextRegistry.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKGLSharedContextRegistry.m
$(OBJDIR)/IKGLTextCache.o: src/IKGLTextCache.m src/IKGLTextCache.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKGLTextCache.m
$(OBJDIR)/IKGLTextCacheFragHandler.o: src/IKGLTextCacheFragHandler.m src/IKGLTextCacheFragHandler.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKGLTextCacheFragHandler.m
$(OBJDIR)/IKGLTextGenerator.o: src/IKGLTextGenerator.m src/IKGLTextGenerator.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKGLTextGenerator.m
$(OBJDIR)/IKGLTextInfo.o: src/IKGLTextInfo.m src/IKGLTextInfo.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKGLTextInfo.m
$(OBJDIR)/IKGLTextRenderer.o: src/IKGLTextRenderer.m src/IKGLTextRenderer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKGLTextRenderer.m
$(OBJDIR)/IKGLTextSizeCache.o: src/IKGLTextSizeCache.m src/IKGLTextSizeCache.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKGLTextSizeCache.m
$(OBJDIR)/IKGLTextSubpixelShader.o: src/IKGLTextSubpixelShader.m src/IKGLTextSubpixelShader.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKGLTextSubpixelShader.m
$(OBJDIR)/IKGradientHorizontalSeparatorGrooved.o: src/IKGradientHorizontalSeparatorGrooved.m src/IKGradientHorizontalSeparatorGrooved.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKGradientHorizontalSeparatorGrooved.m
$(OBJDIR)/IKGradientHorizontalSeparatorTapered.o: src/IKGradientHorizontalSeparatorTapered.m src/IKGradientHorizontalSeparatorTapered.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKGradientHorizontalSeparatorTapered.m
$(OBJDIR)/IKGradientImageButton.o: src/IKGradientImageButton.m src/IKGradientImageButton.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKGradientImageButton.m
$(OBJDIR)/IKGradientImageButtonCell.o: src/IKGradientImageButtonCell.m src/IKGradientImageButtonCell.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKGradientImageButtonCell.m
$(OBJDIR)/IKGraySlider.o: src/IKGraySlider.m src/IKGraySlider.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKGraySlider.m
$(OBJDIR)/IKGraySliderCell.o: src/IKGraySliderCell.m src/IKGraySliderCell.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKGraySliderCell.m
$(OBJDIR)/IKGuidesLayer.o: src/IKGuidesLayer.m src/IKGuidesLayer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKGuidesLayer.m
$(OBJDIR)/IKHardwareCapsChangeNotifier.o: src/IKHardwareCapsChangeNotifier.m src/IKHardwareCapsChangeNotifier.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKHardwareCapsChangeNotifier.m
$(OBJDIR)/IKHierarchicalDatasourceAdaptor.o: src/IKHierarchicalDatasourceAdaptor.m src/IKHierarchicalDatasourceAdaptor.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKHierarchicalDatasourceAdaptor.m
$(OBJDIR)/IKICInfoHandler.o: src/IKICInfoHandler.m src/IKICInfoHandler.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKICInfoHandler.m
$(OBJDIR)/IKIMGPreviewCell.o: src/IKIMGPreviewCell.m src/IKIMGPreviewCell.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKIMGPreviewCell.m
$(OBJDIR)/IKIconCell.o: src/IKIconCell.m src/IKIconCell.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKIconCell.m
$(OBJDIR)/IKIconDatabase.o: src/IKIconDatabase.m src/IKIconDatabase.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKIconDatabase.m
$(OBJDIR)/IKImageAdjust.o: src/IKImageAdjust.m src/IKImageAdjust.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageAdjust.m
$(OBJDIR)/IKImageAdjustSlider.o: src/IKImageAdjustSlider.m src/IKImageAdjustSlider.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageAdjustSlider.m
$(OBJDIR)/IKImageAdjustSliderCell.o: src/IKImageAdjustSliderCell.m src/IKImageAdjustSliderCell.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageAdjustSliderCell.m
$(OBJDIR)/IKImageAdjustView.o: src/IKImageAdjustView.m src/IKImageAdjustView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageAdjustView.m
$(OBJDIR)/IKImageAnalysisManager.o: src/IKImageAnalysisManager.m src/IKImageAnalysisManager.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageAnalysisManager.m
$(OBJDIR)/IKImageBackgroundLayer.o: src/IKImageBackgroundLayer.m src/IKImageBackgroundLayer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageBackgroundLayer.m
$(OBJDIR)/IKImageBackgroundThumbnailMaskLayer.o: src/IKImageBackgroundThumbnailMaskLayer.m src/IKImageBackgroundThumbnailMaskLayer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageBackgroundThumbnailMaskLayer.m
$(OBJDIR)/IKImageBannerView.o: src/IKImageBannerView.m src/IKImageBannerView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageBannerView.m
$(OBJDIR)/IKImageBlockLayer.o: src/IKImageBlockLayer.m src/IKImageBlockLayer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageBlockLayer.m
$(OBJDIR)/IKImageBrowserAccessibilityCell.o: src/IKImageBrowserAccessibilityCell.m src/IKImageBrowserAccessibilityCell.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageBrowserAccessibilityCell.m
$(OBJDIR)/IKImageBrowserAppearAnimation.o: src/IKImageBrowserAppearAnimation.m src/IKImageBrowserAppearAnimation.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageBrowserAppearAnimation.m
$(OBJDIR)/IKImageBrowserBookletGrid.o: src/IKImageBrowserBookletGrid.m src/IKImageBrowserBookletGrid.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageBrowserBookletGrid.m
$(OBJDIR)/IKImageBrowserCell.o: src/IKImageBrowserCell.m src/IKImageBrowserCell.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageBrowserCell.m
$(OBJDIR)/IKImageBrowserCellOffscreenRenderer.o: src/IKImageBrowserCellOffscreenRenderer.m src/IKImageBrowserCellOffscreenRenderer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageBrowserCellOffscreenRenderer.m
$(OBJDIR)/IKImageBrowserCoverFlowGrid.o: src/IKImageBrowserCoverFlowGrid.m src/IKImageBrowserCoverFlowGrid.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageBrowserCoverFlowGrid.m
$(OBJDIR)/IKImageBrowserCoverFlowIntertiaAnimation.o: src/IKImageBrowserCoverFlowIntertiaAnimation.m src/IKImageBrowserCoverFlowIntertiaAnimation.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageBrowserCoverFlowIntertiaAnimation.m
$(OBJDIR)/IKImageBrowserCoverFlowScrollingAnimation.o: src/IKImageBrowserCoverFlowScrollingAnimation.m src/IKImageBrowserCoverFlowScrollingAnimation.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageBrowserCoverFlowScrollingAnimation.m
$(OBJDIR)/IKImageBrowserDisappearAnimation.o: src/IKImageBrowserDisappearAnimation.m src/IKImageBrowserDisappearAnimation.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageBrowserDisappearAnimation.m
$(OBJDIR)/IKImageBrowserExpandCollapseGroupAnimation.o: src/IKImageBrowserExpandCollapseGroupAnimation.m src/IKImageBrowserExpandCollapseGroupAnimation.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageBrowserExpandCollapseGroupAnimation.m
$(OBJDIR)/IKImageBrowserExpandCollapseItemsAnimation.o: src/IKImageBrowserExpandCollapseItemsAnimation.m src/IKImageBrowserExpandCollapseItemsAnimation.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageBrowserExpandCollapseItemsAnimation.m
$(OBJDIR)/IKImageBrowserExpandCollapseiOSGroupAnimation.o: src/IKImageBrowserExpandCollapseiOSGroupAnimation.m src/IKImageBrowserExpandCollapseiOSGroupAnimation.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageBrowserExpandCollapseiOSGroupAnimation.m
$(OBJDIR)/IKImageBrowserFloatingGroupGrid.o: src/IKImageBrowserFloatingGroupGrid.m src/IKImageBrowserFloatingGroupGrid.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageBrowserFloatingGroupGrid.m
$(OBJDIR)/IKImageBrowserFreeFormLayout.o: src/IKImageBrowserFreeFormLayout.m src/IKImageBrowserFreeFormLayout.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageBrowserFreeFormLayout.m
$(OBJDIR)/IKImageBrowserFreezeAnimation.o: src/IKImageBrowserFreezeAnimation.m src/IKImageBrowserFreezeAnimation.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageBrowserFreezeAnimation.m
$(OBJDIR)/IKImageBrowserGenieEffectManager.o: src/IKImageBrowserGenieEffectManager.m src/IKImageBrowserGenieEffectManager.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageBrowserGenieEffectManager.m
$(OBJDIR)/IKImageBrowserGenieView.o: src/IKImageBrowserGenieView.m src/IKImageBrowserGenieView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageBrowserGenieView.m
$(OBJDIR)/IKImageBrowserGenieWindow.o: src/IKImageBrowserGenieWindow.m src/IKImageBrowserGenieWindow.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageBrowserGenieWindow.m
$(OBJDIR)/IKImageBrowserGrid.o: src/IKImageBrowserGrid.m src/IKImageBrowserGrid.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageBrowserGrid.m
$(OBJDIR)/IKImageBrowserGridGroup.o: src/IKImageBrowserGridGroup.m src/IKImageBrowserGridGroup.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageBrowserGridGroup.m
$(OBJDIR)/IKImageBrowserImportAnimation.o: src/IKImageBrowserImportAnimation.m src/IKImageBrowserImportAnimation.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageBrowserImportAnimation.m
$(OBJDIR)/IKImageBrowserLayoutManager.o: src/IKImageBrowserLayoutManager.m src/IKImageBrowserLayoutManager.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageBrowserLayoutManager.m
$(OBJDIR)/IKImageBrowserMagnifying.o: src/IKImageBrowserMagnifying.m src/IKImageBrowserMagnifying.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageBrowserMagnifying.m
$(OBJDIR)/IKImageBrowserReorderAnimation.o: src/IKImageBrowserReorderAnimation.m src/IKImageBrowserReorderAnimation.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageBrowserReorderAnimation.m
$(OBJDIR)/IKImageBrowserScrollAnimation.o: src/IKImageBrowserScrollAnimation.m src/IKImageBrowserScrollAnimation.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageBrowserScrollAnimation.m
$(OBJDIR)/IKImageBrowserSubsetLayoutManager.o: src/IKImageBrowserSubsetLayoutManager.m src/IKImageBrowserSubsetLayoutManager.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageBrowserSubsetLayoutManager.m
$(OBJDIR)/IKImageBrowserVMScheduler.o: src/IKImageBrowserVMScheduler.m src/IKImageBrowserVMScheduler.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageBrowserVMScheduler.m
$(OBJDIR)/IKImageBrowserView.o: src/IKImageBrowserView.m src/IKImageBrowserView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageBrowserView.m
$(OBJDIR)/IKImageBrowseriOSGroupDimCellsAnimation.o: src/IKImageBrowseriOSGroupDimCellsAnimation.m src/IKImageBrowseriOSGroupDimCellsAnimation.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageBrowseriOSGroupDimCellsAnimation.m
$(OBJDIR)/IKImageBrowseriOSGroupGrid.o: src/IKImageBrowseriOSGroupGrid.m src/IKImageBrowseriOSGroupGrid.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageBrowseriOSGroupGrid.m
$(OBJDIR)/IKImageBrowseriOSGroupHighlightCellAnimation.o: src/IKImageBrowseriOSGroupHighlightCellAnimation.m src/IKImageBrowseriOSGroupHighlightCellAnimation.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageBrowseriOSGroupHighlightCellAnimation.m
$(OBJDIR)/IKImageCell.o: src/IKImageCell.m src/IKImageCell.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageCell.m
$(OBJDIR)/IKImageCellDatasourceProxy.o: src/IKImageCellDatasourceProxy.m src/IKImageCellDatasourceProxy.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageCellDatasourceProxy.m
$(OBJDIR)/IKImageCellReservedIvars.o: src/IKImageCellReservedIvars.m src/IKImageCellReservedIvars.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageCellReservedIvars.m
$(OBJDIR)/IKImageCellTrackingViewDatasourceProxy.o: src/IKImageCellTrackingViewDatasourceProxy.m src/IKImageCellTrackingViewDatasourceProxy.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageCellTrackingViewDatasourceProxy.m
$(OBJDIR)/IKImageClipView.o: src/IKImageClipView.m src/IKImageClipView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageClipView.m
$(OBJDIR)/IKImageContentView.o: src/IKImageContentView.m src/IKImageContentView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageContentView.m
$(OBJDIR)/IKImageCorrection.o: src/IKImageCorrection.m src/IKImageCorrection.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageCorrection.m
$(OBJDIR)/IKImageCorrectionHandler.o: src/IKImageCorrectionHandler.m src/IKImageCorrectionHandler.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageCorrectionHandler.m
$(OBJDIR)/IKImageCropPRS.o: src/IKImageCropPRS.m src/IKImageCropPRS.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageCropPRS.m
$(OBJDIR)/IKImageCropView.o: src/IKImageCropView.m src/IKImageCropView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageCropView.m
$(OBJDIR)/IKImageCropViewEffect.o: src/IKImageCropViewEffect.m src/IKImageCropViewEffect.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageCropViewEffect.m
$(OBJDIR)/IKImageCropViewSlider.o: src/IKImageCropViewSlider.m src/IKImageCropViewSlider.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageCropViewSlider.m
$(OBJDIR)/IKImageEditDSHandler.o: src/IKImageEditDSHandler.m src/IKImageEditDSHandler.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageEditDSHandler.m
$(OBJDIR)/IKImageEditFrame.o: src/IKImageEditFrame.m src/IKImageEditFrame.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageEditFrame.m
$(OBJDIR)/IKImageEditFrameToolbar.o: src/IKImageEditFrameToolbar.m src/IKImageEditFrameToolbar.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageEditFrameToolbar.m
$(OBJDIR)/IKImageEditPanel.o: src/IKImageEditPanel.m src/IKImageEditPanel.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageEditPanel.m
$(OBJDIR)/IKImageEditPanelButton.o: src/IKImageEditPanelButton.m src/IKImageEditPanelButton.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageEditPanelButton.m
$(OBJDIR)/IKImageEditPanelController.o: src/IKImageEditPanelController.m src/IKImageEditPanelController.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageEditPanelController.m
$(OBJDIR)/IKImageEditPanelPrivateData.o: src/IKImageEditPanelPrivateData.m src/IKImageEditPanelPrivateData.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageEditPanelPrivateData.m
$(OBJDIR)/IKImageEditView.o: src/IKImageEditView.m src/IKImageEditView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageEditView.m
$(OBJDIR)/IKImageEditWorldMap.o: src/IKImageEditWorldMap.m src/IKImageEditWorldMap.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageEditWorldMap.m
$(OBJDIR)/IKImageEditWorldMapOld.o: src/IKImageEditWorldMapOld.m src/IKImageEditWorldMapOld.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageEditWorldMapOld.m
$(OBJDIR)/IKImageEffects.o: src/IKImageEffects.m src/IKImageEffects.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageEffects.m
$(OBJDIR)/IKImageEffectsView.o: src/IKImageEffectsView.m src/IKImageEffectsView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageEffectsView.m
$(OBJDIR)/IKImageFlowAccessibilityCell.o: src/IKImageFlowAccessibilityCell.m src/IKImageFlowAccessibilityCell.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageFlowAccessibilityCell.m
$(OBJDIR)/IKImageFlowAccessibilityList.o: src/IKImageFlowAccessibilityList.m src/IKImageFlowAccessibilityList.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageFlowAccessibilityList.m
$(OBJDIR)/IKImageFlowAppearAnimation.o: src/IKImageFlowAppearAnimation.m src/IKImageFlowAppearAnimation.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageFlowAppearAnimation.m
$(OBJDIR)/IKImageFlowCell.o: src/IKImageFlowCell.m src/IKImageFlowCell.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageFlowCell.m
$(OBJDIR)/IKImageFlowDisappearAnimation.o: src/IKImageFlowDisappearAnimation.m src/IKImageFlowDisappearAnimation.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageFlowDisappearAnimation.m
$(OBJDIR)/IKImageFlowFlipAnimation.o: src/IKImageFlowFlipAnimation.m src/IKImageFlowFlipAnimation.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageFlowFlipAnimation.m
$(OBJDIR)/IKImageFlowImportAnimation.o: src/IKImageFlowImportAnimation.m src/IKImageFlowImportAnimation.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageFlowImportAnimation.m
$(OBJDIR)/IKImageFlowScrollingAnimation.o: src/IKImageFlowScrollingAnimation.m src/IKImageFlowScrollingAnimation.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageFlowScrollingAnimation.m
$(OBJDIR)/IKImageFlowView.o: src/IKImageFlowView.m src/IKImageFlowView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageFlowView.m
$(OBJDIR)/IKImageGridItem.o: src/IKImageGridItem.m src/IKImageGridItem.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageGridItem.m
$(OBJDIR)/IKImageHistogram.o: src/IKImageHistogram.m src/IKImageHistogram.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageHistogram.m
$(OBJDIR)/IKImageInfo.o: src/IKImageInfo.m src/IKImageInfo.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageInfo.m
$(OBJDIR)/IKImageInfoView.o: src/IKImageInfoView.m src/IKImageInfoView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageInfoView.m
$(OBJDIR)/IKImageLayer.o: src/IKImageLayer.m src/IKImageLayer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageLayer.m
$(OBJDIR)/IKImagePasteboardLayer.o: src/IKImagePasteboardLayer.m src/IKImagePasteboardLayer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImagePasteboardLayer.m
$(OBJDIR)/IKImagePicker.o: src/IKImagePicker.m src/IKImagePicker.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImagePicker.m
$(OBJDIR)/IKImageRenderInfo.o: src/IKImageRenderInfo.m src/IKImageRenderInfo.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageRenderInfo.m
$(OBJDIR)/IKImageState.o: src/IKImageState.m src/IKImageState.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageState.m
$(OBJDIR)/IKImageTextureRange.o: src/IKImageTextureRange.m src/IKImageTextureRange.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageTextureRange.m
$(OBJDIR)/IKImageView.o: src/IKImageView.m src/IKImageView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageView.m
$(OBJDIR)/IKImageView2.o: src/IKImageView2.m src/IKImageView2.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageView2.m
$(OBJDIR)/IKImageView2ScrollView.o: src/IKImageView2ScrollView.m src/IKImageView2ScrollView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageView2ScrollView.m
$(OBJDIR)/IKImageViewLayerQueue.o: src/IKImageViewLayerQueue.m src/IKImageViewLayerQueue.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageViewLayerQueue.m
$(OBJDIR)/IKImageViewPrivateData.o: src/IKImageViewPrivateData.m src/IKImageViewPrivateData.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageViewPrivateData.m
$(OBJDIR)/IKImageViewUtils.o: src/IKImageViewUtils.m src/IKImageViewUtils.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageViewUtils.m
$(OBJDIR)/IKImageWrapper.o: src/IKImageWrapper.m src/IKImageWrapper.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageWrapper.m
$(OBJDIR)/IKImageWrapperAnimatedGifCache.o: src/IKImageWrapperAnimatedGifCache.m src/IKImageWrapperAnimatedGifCache.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKImageWrapperAnimatedGifCache.m
$(OBJDIR)/IKInfoTabView.o: src/IKInfoTabView.m src/IKInfoTabView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKInfoTabView.m
$(OBJDIR)/IKInterfaceBuilderImage.o: src/IKInterfaceBuilderImage.m src/IKInterfaceBuilderImage.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKInterfaceBuilderImage.m
$(OBJDIR)/IKInterfaceBuilderSharedDatasource.o: src/IKInterfaceBuilderSharedDatasource.m src/IKInterfaceBuilderSharedDatasource.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKInterfaceBuilderSharedDatasource.m
$(OBJDIR)/IKInterfaceBuilderSharedDelegate.o: src/IKInterfaceBuilderSharedDelegate.m src/IKInterfaceBuilderSharedDelegate.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKInterfaceBuilderSharedDelegate.m
$(OBJDIR)/IKIrisListener.o: src/IKIrisListener.m src/IKIrisListener.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKIrisListener.m
$(OBJDIR)/IKKnob.o: src/IKKnob.m src/IKKnob.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKKnob.m
$(OBJDIR)/IKKnobLayer.o: src/IKKnobLayer.m src/IKKnobLayer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKKnobLayer.m
$(OBJDIR)/IKLassoSelection.o: src/IKLassoSelection.m src/IKLassoSelection.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKLassoSelection.m
$(OBJDIR)/IKLayerRenderer.o: src/IKLayerRenderer.m src/IKLayerRenderer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKLayerRenderer.m
$(OBJDIR)/IKLinkedList.o: src/IKLinkedList.m src/IKLinkedList.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKLinkedList.m
$(OBJDIR)/IKLinkedListLink.o: src/IKLinkedListLink.m src/IKLinkedListLink.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKLinkedListLink.m
$(OBJDIR)/IKLinkedListNode.o: src/IKLinkedListNode.m src/IKLinkedListNode.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKLinkedListNode.m
$(OBJDIR)/IKLinkedListNodePool.o: src/IKLinkedListNodePool.m src/IKLinkedListNodePool.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKLinkedListNodePool.m
$(OBJDIR)/IKMediaPlugin.o: src/IKMediaPlugin.m src/IKMediaPlugin.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKMediaPlugin.m
$(OBJDIR)/IKMetadataHandler.o: src/IKMetadataHandler.m src/IKMetadataHandler.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKMetadataHandler.m
$(OBJDIR)/IKMipmapImage.o: src/IKMipmapImage.m src/IKMipmapImage.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKMipmapImage.m
$(OBJDIR)/IKMipmapItem.o: src/IKMipmapItem.m src/IKMipmapItem.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKMipmapItem.m
$(OBJDIR)/IKMonitorBrightnessController.o: src/IKMonitorBrightnessController.m src/IKMonitorBrightnessController.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKMonitorBrightnessController.m
$(OBJDIR)/IKMultipleSegmentedRawDataBuffer.o: src/IKMultipleSegmentedRawDataBuffer.m src/IKMultipleSegmentedRawDataBuffer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKMultipleSegmentedRawDataBuffer.m
$(OBJDIR)/IKNAnnotation.o: src/IKNAnnotation.m src/IKNAnnotation.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKNAnnotation.m
$(OBJDIR)/IKNCustomLayer.o: src/IKNCustomLayer.m src/IKNCustomLayer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKNCustomLayer.m
$(OBJDIR)/IKNImageLayer.o: src/IKNImageLayer.m src/IKNImageLayer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKNImageLayer.m
$(OBJDIR)/IKNImageView.o: src/IKNImageView.m src/IKNImageView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKNImageView.m
$(OBJDIR)/IKNImageViewHandler.o: src/IKNImageViewHandler.m src/IKNImageViewHandler.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKNImageViewHandler.m
$(OBJDIR)/IKNKnobsLayer.o: src/IKNKnobsLayer.m src/IKNKnobsLayer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKNKnobsLayer.m
$(OBJDIR)/IKNProgressLayer.o: src/IKNProgressLayer.m src/IKNProgressLayer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKNProgressLayer.m
$(OBJDIR)/IKNRootLayer.o: src/IKNRootLayer.m src/IKNRootLayer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKNRootLayer.m
$(OBJDIR)/IKNSelection.o: src/IKNSelection.m src/IKNSelection.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKNSelection.m
$(OBJDIR)/IKNStatusRoot.o: src/IKNStatusRoot.m src/IKNStatusRoot.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKNStatusRoot.m
$(OBJDIR)/IKNStatusView.o: src/IKNStatusView.m src/IKNStatusView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKNStatusView.m
$(OBJDIR)/IKNStatusView2.o: src/IKNStatusView2.m src/IKNStatusView2.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKNStatusView2.m
$(OBJDIR)/IKNavigationImageLayer.o: src/IKNavigationImageLayer.m src/IKNavigationImageLayer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKNavigationImageLayer.m
$(OBJDIR)/IKNavigationLayer.o: src/IKNavigationLayer.m src/IKNavigationLayer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKNavigationLayer.m
$(OBJDIR)/IKNavigationRectLayer.o: src/IKNavigationRectLayer.m src/IKNavigationRectLayer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKNavigationRectLayer.m
$(OBJDIR)/IKNoActionShapeLayer.o: src/IKNoActionShapeLayer.m src/IKNoActionShapeLayer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKNoActionShapeLayer.m
$(OBJDIR)/IKOpenGLRenderer.o: src/IKOpenGLRenderer.m src/IKOpenGLRenderer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKOpenGLRenderer.m
$(OBJDIR)/IKOpenGLRoundedRectRenderer.o: src/IKOpenGLRoundedRectRenderer.m src/IKOpenGLRoundedRectRenderer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKOpenGLRoundedRectRenderer.m
$(OBJDIR)/IKOpenGLRoundedRectRendererCache.o: src/IKOpenGLRoundedRectRendererCache.m src/IKOpenGLRoundedRectRendererCache.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKOpenGLRoundedRectRendererCache.m
$(OBJDIR)/IKPBNotePlayer.o: src/IKPBNotePlayer.m src/IKPBNotePlayer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKPBNotePlayer.m
$(OBJDIR)/IKPPFloatingWindow.o: src/IKPPFloatingWindow.m src/IKPPFloatingWindow.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKPPFloatingWindow.m
$(OBJDIR)/IKPPFloatingWindowAnimation.o: src/IKPPFloatingWindowAnimation.m src/IKPPFloatingWindowAnimation.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKPPFloatingWindowAnimation.m
$(OBJDIR)/IKPTCropView.o: src/IKPTCropView.m src/IKPTCropView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKPTCropView.m
$(OBJDIR)/IKPTImageGridCell.o: src/IKPTImageGridCell.m src/IKPTImageGridCell.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKPTImageGridCell.m
$(OBJDIR)/IKPTImageGridView.o: src/IKPTImageGridView.m src/IKPTImageGridView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKPTImageGridView.m
$(OBJDIR)/IKPTImageViewForAnimation.o: src/IKPTImageViewForAnimation.m src/IKPTImageViewForAnimation.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKPTImageViewForAnimation.m
$(OBJDIR)/IKPageLayout.o: src/IKPageLayout.m src/IKPageLayout.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKPageLayout.m
$(OBJDIR)/IKPastedImage.o: src/IKPastedImage.m src/IKPastedImage.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKPastedImage.m
$(OBJDIR)/IKPathPopupButton.o: src/IKPathPopupButton.m src/IKPathPopupButton.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKPathPopupButton.m
$(OBJDIR)/IKPathToCIImageValueTransformer.o: src/IKPathToCIImageValueTransformer.m src/IKPathToCIImageValueTransformer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKPathToCIImageValueTransformer.m
$(OBJDIR)/IKPictureTaker.o: src/IKPictureTaker.m src/IKPictureTaker.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKPictureTaker.m
$(OBJDIR)/IKPictureTakerController.o: src/IKPictureTakerController.m src/IKPictureTakerController.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKPictureTakerController.m
$(OBJDIR)/IKPictureTakerCropView.o: src/IKPictureTakerCropView.m src/IKPictureTakerCropView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKPictureTakerCropView.m
$(OBJDIR)/IKPictureTakerRecentPicture.o: src/IKPictureTakerRecentPicture.m src/IKPictureTakerRecentPicture.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKPictureTakerRecentPicture.m
$(OBJDIR)/IKPictureTakerRecentPictureRepository.o: src/IKPictureTakerRecentPictureRepository.m src/IKPictureTakerRecentPictureRepository.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKPictureTakerRecentPictureRepository.m
$(OBJDIR)/IKPlaceholderItem.o: src/IKPlaceholderItem.m src/IKPlaceholderItem.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKPlaceholderItem.m
$(OBJDIR)/IKPlaceholderLayer.o: src/IKPlaceholderLayer.m src/IKPlaceholderLayer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKPlaceholderLayer.m
$(OBJDIR)/IKPrivateGraphics.o: src/IKPrivateGraphics.m src/IKPrivateGraphics.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKPrivateGraphics.m
$(OBJDIR)/IKProKitCell.o: src/IKProKitCell.m src/IKProKitCell.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKProKitCell.m
$(OBJDIR)/IKProfilePictureRolloverLayer.o: src/IKProfilePictureRolloverLayer.m src/IKProfilePictureRolloverLayer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKProfilePictureRolloverLayer.m
$(OBJDIR)/IKProfilePictureView.o: src/IKProfilePictureView.m src/IKProfilePictureView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKProfilePictureView.m
$(OBJDIR)/IKRadianToDegreeValueTransformer.o: src/IKRadianToDegreeValueTransformer.m src/IKRadianToDegreeValueTransformer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKRadianToDegreeValueTransformer.m
$(OBJDIR)/IKRamManager.o: src/IKRamManager.m src/IKRamManager.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKRamManager.m
$(OBJDIR)/IKRangeFormatter.o: src/IKRangeFormatter.m src/IKRangeFormatter.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKRangeFormatter.m
$(OBJDIR)/IKRectAnnotation.o: src/IKRectAnnotation.m src/IKRectAnnotation.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKRectAnnotation.m
$(OBJDIR)/IKRectSelection.o: src/IKRectSelection.m src/IKRectSelection.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKRectSelection.m
$(OBJDIR)/IKRectSelectionImageCapture.o: src/IKRectSelectionImageCapture.m src/IKRectSelectionImageCapture.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKRectSelectionImageCapture.m
$(OBJDIR)/IKRectanglePacker.o: src/IKRectanglePacker.m src/IKRectanglePacker.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKRectanglePacker.m
$(OBJDIR)/IKReflectionCell.o: src/IKReflectionCell.m src/IKReflectionCell.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKReflectionCell.m
$(OBJDIR)/IKReflectiveIconCell.o: src/IKReflectiveIconCell.m src/IKReflectiveIconCell.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKReflectiveIconCell.m
$(OBJDIR)/IKRootLayer.o: src/IKRootLayer.m src/IKRootLayer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKRootLayer.m
$(OBJDIR)/IKRootLayout.o: src/IKRootLayout.m src/IKRootLayout.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKRootLayout.m
$(OBJDIR)/IKRotationLayer.o: src/IKRotationLayer.m src/IKRotationLayer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKRotationLayer.m
$(OBJDIR)/IKSFCropElement.o: src/IKSFCropElement.m src/IKSFCropElement.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKSFCropElement.m
$(OBJDIR)/IKSFEffectDescription.o: src/IKSFEffectDescription.m src/IKSFEffectDescription.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKSFEffectDescription.m
$(OBJDIR)/IKSFElement.o: src/IKSFElement.m src/IKSFElement.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKSFElement.m
$(OBJDIR)/IKSSBackgroundImageView.o: src/IKSSBackgroundImageView.m src/IKSSBackgroundImageView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKSSBackgroundImageView.m
$(OBJDIR)/IKSSBackgroundWindow.o: src/IKSSBackgroundWindow.m src/IKSSBackgroundWindow.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKSSBackgroundWindow.m
$(OBJDIR)/IKSSButton.o: src/IKSSButton.m src/IKSSButton.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKSSButton.m
$(OBJDIR)/IKSSContentLayer.o: src/IKSSContentLayer.m src/IKSSContentLayer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKSSContentLayer.m
$(OBJDIR)/IKSSEventLessLayer.o: src/IKSSEventLessLayer.m src/IKSSEventLessLayer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKSSEventLessLayer.m
$(OBJDIR)/IKSSGradientLayer.o: src/IKSSGradientLayer.m src/IKSSGradientLayer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKSSGradientLayer.m
$(OBJDIR)/IKSSImageView.o: src/IKSSImageView.m src/IKSSImageView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKSSImageView.m
$(OBJDIR)/IKSSIndexHandler.o: src/IKSSIndexHandler.m src/IKSSIndexHandler.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKSSIndexHandler.m
$(OBJDIR)/IKSSIndexSheetSelectionLayer.o: src/IKSSIndexSheetSelectionLayer.m src/IKSSIndexSheetSelectionLayer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKSSIndexSheetSelectionLayer.m
$(OBJDIR)/IKSSIndexSheetTextLayer.o: src/IKSSIndexSheetTextLayer.m src/IKSSIndexSheetTextLayer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKSSIndexSheetTextLayer.m
$(OBJDIR)/IKSSIndexView.o: src/IKSSIndexView.m src/IKSSIndexView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKSSIndexView.m
$(OBJDIR)/IKSSPDFView.o: src/IKSSPDFView.m src/IKSSPDFView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKSSPDFView.m
$(OBJDIR)/IKSSPanel.o: src/IKSSPanel.m src/IKSSPanel.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKSSPanel.m
$(OBJDIR)/IKSSThumbnailLayer.o: src/IKSSThumbnailLayer.m src/IKSSThumbnailLayer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKSSThumbnailLayer.m
$(OBJDIR)/IKSSToolTip.o: src/IKSSToolTip.m src/IKSSToolTip.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKSSToolTip.m
$(OBJDIR)/IKSSToolTipView.o: src/IKSSToolTipView.m src/IKSSToolTipView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKSSToolTipView.m
$(OBJDIR)/IKSaveOptions.o: src/IKSaveOptions.m src/IKSaveOptions.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKSaveOptions.m
$(OBJDIR)/IKSaveOptionsHandler.o: src/IKSaveOptionsHandler.m src/IKSaveOptionsHandler.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKSaveOptionsHandler.m
$(OBJDIR)/IKScan.o: src/IKScan.m src/IKScan.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKScan.m
$(OBJDIR)/IKScanArea.o: src/IKScanArea.m src/IKScanArea.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKScanArea.m
$(OBJDIR)/IKScanInfo.o: src/IKScanInfo.m src/IKScanInfo.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKScanInfo.m
$(OBJDIR)/IKScanResult.o: src/IKScanResult.m src/IKScanResult.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKScanResult.m
$(OBJDIR)/IKScanResultsHandler.o: src/IKScanResultsHandler.m src/IKScanResultsHandler.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKScanResultsHandler.m
$(OBJDIR)/IKScanResultsTextCellView.o: src/IKScanResultsTextCellView.m src/IKScanResultsTextCellView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKScanResultsTextCellView.m
$(OBJDIR)/IKScanUIController.o: src/IKScanUIController.m src/IKScanUIController.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKScanUIController.m
$(OBJDIR)/IKScanUIControllerAdvanced.o: src/IKScanUIControllerAdvanced.m src/IKScanUIControllerAdvanced.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKScanUIControllerAdvanced.m
$(OBJDIR)/IKScanUIControllerSimple.o: src/IKScanUIControllerSimple.m src/IKScanUIControllerSimple.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKScanUIControllerSimple.m
$(OBJDIR)/IKScanUIViewAdvanced.o: src/IKScanUIViewAdvanced.m src/IKScanUIViewAdvanced.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKScanUIViewAdvanced.m
$(OBJDIR)/IKScanUIViewSimple.o: src/IKScanUIViewSimple.m src/IKScanUIViewSimple.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKScanUIViewSimple.m
$(OBJDIR)/IKScannerDeviceView.o: src/IKScannerDeviceView.m src/IKScannerDeviceView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKScannerDeviceView.m
$(OBJDIR)/IKScannerDeviceViewHandler.o: src/IKScannerDeviceViewHandler.m src/IKScannerDeviceViewHandler.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKScannerDeviceViewHandler.m
$(OBJDIR)/IKScannerDeviceViewHandlerIB.o: src/IKScannerDeviceViewHandlerIB.m src/IKScannerDeviceViewHandlerIB.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKScannerDeviceViewHandlerIB.m
$(OBJDIR)/IKScannerNoDeviceView.o: src/IKScannerNoDeviceView.m src/IKScannerNoDeviceView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKScannerNoDeviceView.m
$(OBJDIR)/IKScannerParameterView.o: src/IKScannerParameterView.m src/IKScannerParameterView.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKScannerParameterView.m
$(OBJDIR)/IKScannerPreviewAdvanced.o: src/IKScannerPreviewAdvanced.m src/IKScannerPreviewAdvanced.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKScannerPreviewAdvanced.m
$(OBJDIR)/IKScannerPreviewSimple.o: src/IKScannerPreviewSimple.m src/IKScannerPreviewSimple.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKScannerPreviewSimple.m
$(OBJDIR)/IKScannerSelfTest.o: src/IKScannerSelfTest.m src/IKScannerSelfTest.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKScannerSelfTest.m
$(OBJDIR)/IKSegmentedRawDataBuffer.o: src/IKSegmentedRawDataBuffer.m src/IKSegmentedRawDataBuffer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKSegmentedRawDataBuffer.m
$(OBJDIR)/IKSelection.o: src/IKSelection.m src/IKSelection.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKSelection.m
$(OBJDIR)/IKSelectionLayer.o: src/IKSelectionLayer.m src/IKSelectionLayer.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKSelectionLayer.m
$(OBJDIR)/IKSelfTestHandler.o: src/IKSelfTestHandler.m src/IKSelfTestHandler.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKSelfTestHandler.m
$(OBJDIR)/IKShadowTool.o: src/IKShadowTool.m src/IKShadowTool.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKShadowTool.m
$(OBJDIR)/IKSlideshow.o: src/IKSlideshow.m src/IKSlideshow.h
	@mkdir -p $(OBJDIR)
	$(CC) $(MFLAGS) -c -o $@ src/IKSlideshow.m

install: all
	install -d $(DESTDIR)$(PREFIX)/Library/Frameworks
	cp -R $(FW_ID) $(DESTDIR)$(PREFIX)/Library/Frameworks/

clean:
	rm -rf build

.PHONY: all install clean

test: all
	@echo "no tests defined yet"
