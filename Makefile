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
FW_HDRS   := IKImageView.h IKPrivateGraphics.h ImageKit.h ImageKitBase.h IKPictureTaker.h IKSlideshow.h IKImageBrowserView.h IKImageEditPanel.h IKFilterBrowserView.h IKFilterPanel.h IKSaveOptions.h IKPageLayout.h IKCacheManager.h
FW_HDR_DEPS := src/IKImageView.h src/IKPrivateGraphics.h src/ImageKit.h src/ImageKitBase.h src/IKPictureTaker.h src/IKSlideshow.h src/IKImageBrowserView.h src/IKImageEditPanel.h src/IKFilterBrowserView.h src/IKFilterPanel.h src/IKSaveOptions.h src/IKPageLayout.h src/IKCacheManager.h

OBJS := $(OBJDIR)/IKCacheManager.o $(OBJDIR)/IKFilterBrowserView.o $(OBJDIR)/IKFilterPanel.o $(OBJDIR)/IKImageBrowserView.o $(OBJDIR)/IKImageEditPanel.o $(OBJDIR)/IKImageView.o $(OBJDIR)/IKPageLayout.o $(OBJDIR)/IKPictureTaker.o $(OBJDIR)/IKPrivateGraphics.o $(OBJDIR)/IKSaveOptions.o $(OBJDIR)/IKSlideshow.o

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

install: all
	install -d $(DESTDIR)$(PREFIX)/Library/Frameworks
	cp -R $(FW_ID) $(DESTDIR)$(PREFIX)/Library/Frameworks/

clean:
	rm -rf build

.PHONY: all install clean

test: all
	@echo "no tests defined yet"
