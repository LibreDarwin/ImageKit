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

OBJS := $(OBJDIR)/IKCacheManager.o $(OBJDIR)/IKFilterBrowserView.o $(OBJDIR)/IKFilterPanel.o $(OBJDIR)/IKImageBrowserView.o $(OBJDIR)/IKImageEditPanel.o $(OBJDIR)/IKImageView.o $(OBJDIR)/IKPageLayout.o $(OBJDIR)/IKPictureTaker.o $(OBJDIR)/IKPrivateGraphics.o $(OBJDIR)/IKSaveOptions.o $(OBJDIR)/IKSlideshow.o $(OBJDIR)/IKFilterBrowserPanel.o $(OBJDIR)/IKScannerDeviceView.o $(OBJDIR)/IKCameraDeviceView.o $(OBJDIR)/IKDeviceBrowserView.o $(OBJDIR)/IKImageBrowserCell.o $(OBJDIR)/IKFilterUIView.o $(OBJDIR)/IKFilterUI.o

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

install: all
	install -d $(DESTDIR)$(PREFIX)/Library/Frameworks
	cp -R $(FW_ID) $(DESTDIR)$(PREFIX)/Library/Frameworks/

clean:
	rm -rf build

.PHONY: all install clean

test: all
	@echo "no tests defined yet"
