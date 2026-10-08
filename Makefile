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

OBJS := $(OBJDIR)/IK2PartVertical.o $(OBJDIR)/IK3PartHorizontal.o $(OBJDIR)/IKAccessoryView.o $(OBJDIR)/IKAccessoryViewController.o $(OBJDIR)/IKAdjustSlider.o $(OBJDIR)/IKAnimationData.o $(OBJDIR)/IKAnimationGroup.o $(OBJDIR)/IKAnimationManager.o $(OBJDIR)/IKAnnotation.o $(OBJDIR)/IKAnnotationLayer.o $(OBJDIR)/IKAnnotationPanel.o $(OBJDIR)/IKAppKitTextDriver.o $(OBJDIR)/IKArrowAnnotation.o $(OBJDIR)/IKAutoDetection.o $(OBJDIR)/IKAutodetectedItem.o $(OBJDIR)/IKAutolayoutImageView.o $(OBJDIR)/IKBookletCell.o $(OBJDIR)/IKBookletPlasticCover.o $(OBJDIR)/IKBorderedView.o $(OBJDIR)/IKBox.o $(OBJDIR)/IKCGRenderer.o $(OBJDIR)/IKCIFilterCorrection.o $(OBJDIR)/IKCacheContext.o $(OBJDIR)/IKCacheData.o $(OBJDIR)/IKCacheDatabase.o $(OBJDIR)/IKCacheDatabaseEntry.o $(OBJDIR)/IKCacheDatabaseUIDInfo.o $(OBJDIR)/IKCacheFragHandler.o $(OBJDIR)/IKCacheFragHandlerView.o $(OBJDIR)/IKCacheFragHandler_Hole.o $(OBJDIR)/IKCacheManager.o $(OBJDIR)/IKCacheManagerRegistry.o $(OBJDIR)/IKCacheNode.o $(OBJDIR)/IKCacheRamNode.o $(OBJDIR)/IKCacheTimeOutLauncher.o $(OBJDIR)/IKCacheVRamNode.o $(OBJDIR)/IKCameraBackgroundView.o $(OBJDIR)/IKCameraCollectionViewItem.o $(OBJDIR)/IKCameraDeviceView.o $(OBJDIR)/IKCameraDeviceViewHandler.o $(OBJDIR)/IKCameraDeviceViewHandlerIB.o $(OBJDIR)/IKCameraDownloader.o $(OBJDIR)/IKCameraFolderWatcher.o $(OBJDIR)/IKCameraIconCellView.o $(OBJDIR)/IKCameraItem.o $(OBJDIR)/IKCameraServices.o $(OBJDIR)/IKCameraTableView.o $(OBJDIR)/IKCenteredLayer.o $(OBJDIR)/IKCenteringClipView.o $(OBJDIR)/IKCircleAnnotation.o $(OBJDIR)/IKCircleSelection.o $(OBJDIR)/IKCollageCell.o $(OBJDIR)/IKColor.o $(OBJDIR)/IKColorValueTransformer.o $(OBJDIR)/IKColorView.o $(OBJDIR)/IKComposer.o $(OBJDIR)/IKCropLayer.o $(OBJDIR)/IKCropRectSelection.o $(OBJDIR)/IKCustomPathPopupButton.o $(OBJDIR)/IKDVGrabber.o $(OBJDIR)/IKDatasourceDiff.o $(OBJDIR)/IKDatasourceDiffResult.o $(OBJDIR)/IKDatasourceProxy.o $(OBJDIR)/IKDeviceBrowserDataView.o $(OBJDIR)/IKDeviceBrowserHandler.o $(OBJDIR)/IKDeviceBrowserHandlerIB.o $(OBJDIR)/IKDeviceBrowserHeaderView.o $(OBJDIR)/IKDeviceBrowserOutlineView.o $(OBJDIR)/IKDeviceBrowserView.o $(OBJDIR)/IKDeviceItem.o $(OBJDIR)/IKDrawing.o $(OBJDIR)/IKEmbeddedImageEditToolbar.o $(OBJDIR)/IKEmbeddedImageView.o $(OBJDIR)/IKFSEvent.o $(OBJDIR)/IKFilterBrowserPanel.o $(OBJDIR)/IKFilterBrowserView.o $(OBJDIR)/IKFilterChain.o $(OBJDIR)/IKFilterPanel.o $(OBJDIR)/IKFilterPreviewView.o $(OBJDIR)/IKFilterUI.o $(OBJDIR)/IKFilterUIView.o $(OBJDIR)/IKFinderCell.o $(OBJDIR)/IKFinderReflectiveIconCell.o $(OBJDIR)/IKFinderStackIconCell.o $(OBJDIR)/IKFlippedView.o $(OBJDIR)/IKFlockingDatasourceItem.o $(OBJDIR)/IKGLLayer.o $(OBJDIR)/IKGLScroller.o $(OBJDIR)/IKGLSharedContextRegistry.o $(OBJDIR)/IKGLTextCache.o $(OBJDIR)/IKGLTextCacheFragHandler.o $(OBJDIR)/IKGLTextGenerator.o $(OBJDIR)/IKGLTextInfo.o $(OBJDIR)/IKGLTextRenderer.o $(OBJDIR)/IKGLTextSizeCache.o $(OBJDIR)/IKGLTextSubpixelShader.o $(OBJDIR)/IKGradientHorizontalSeparatorGrooved.o $(OBJDIR)/IKGradientHorizontalSeparatorTapered.o $(OBJDIR)/IKGradientImageButton.o $(OBJDIR)/IKGradientImageButtonCell.o $(OBJDIR)/IKGraySlider.o $(OBJDIR)/IKGraySliderCell.o $(OBJDIR)/IKGuidesLayer.o $(OBJDIR)/IKHardwareCapsChangeNotifier.o $(OBJDIR)/IKHierarchicalDatasourceAdaptor.o $(OBJDIR)/IKICInfoHandler.o $(OBJDIR)/IKIMGPreviewCell.o $(OBJDIR)/IKIconCell.o $(OBJDIR)/IKImageBrowserCell.o $(OBJDIR)/IKImageBrowserView.o $(OBJDIR)/IKImageEditPanel.o $(OBJDIR)/IKImageView.o $(OBJDIR)/IKPageLayout.o $(OBJDIR)/IKPictureTaker.o $(OBJDIR)/IKPrivateGraphics.o $(OBJDIR)/IKSaveOptions.o $(OBJDIR)/IKScannerDeviceView.o $(OBJDIR)/IKSlideshow.o

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

install: all
	install -d $(DESTDIR)$(PREFIX)/Library/Frameworks
	cp -R $(FW_ID) $(DESTDIR)$(PREFIX)/Library/Frameworks/

clean:
	rm -rf build

.PHONY: all install clean

test: all
	@echo "no tests defined yet"
