/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 *
 * Behavior fixture for IKCacheRamNode. Loads the framework under test with
 * dlopen() and drives it through a fixed script, emitting one "label<TAB>value"
 * record per observation. Run against Apple's ImageKit and against ours.
 *
 * proxyImage with a non-nil bitmap/data is intentionally not exercised: that
 * path forwards to IKImageWrapper, which is out of scope for this fixture.
 */

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <objc/runtime.h>
#import <dlfcn.h>
#import <stdio.h>

@interface IKCacheRamNode : NSObject
- (id)init;
- (id)parent;
- (void)setParent:(id)parent;
- (unsigned int)cacheUsedByBitmapRep;
- (void)setCacheUsedByBitmapRep:(unsigned int)value;
- (unsigned int)cacheUsedByJpegData;
- (void)setCacheUsedByJpegData:(unsigned int)value;
- (unsigned int)session;
- (void)setSession:(unsigned int)session;
- (int)rawDataFormat;
- (void)setRawDataFormat:(int)format;
- (BOOL)isInPriorityList;
- (void)setIsInPriorityList:(BOOL)flag;
- (unsigned int)totalCacheUsed;
- (id)bitmap;
- (void)setBitmap:(id)bitmap;
- (id)data;
- (void)setData:(id)data;
- (void)willDie;
- (int)proxyDataFormat;
- (id)proxyData;
- (id)proxyImage;
- (id)proxyReferenceInstance;
- (CGSize)proxySize;
- (BOOL)isVectorial;
- (BOOL)supportConcurrentLoading;
- (id)thumbnailWithSize:(double)size antialiased:(BOOL)antialiased quality:(int)quality;
@end

static void emit(NSString *label, NSString *value) {
    printf("%s\t%s\n", label.UTF8String, value.UTF8String);
}

static NSString *i(int v) { return [NSString stringWithFormat:@"%d", v]; }
static NSString *u(unsigned int v) { return [NSString stringWithFormat:@"%u", v]; }
static NSString *b(BOOL v) { return v ? @"YES" : @"NO"; }
static NSString *same(id a, id b) { return a == b ? @"1" : @"0"; }
static NSString *nn(id o) { return o == nil ? @"nil" : @"obj"; }
static NSString *size(CGSize s) {
    return [NSString stringWithFormat:@"%g,%g", s.width, s.height];
}

int main(int argc, char **argv) {
    if (argc != 2) {
        fprintf(stderr, "usage: %s <path to ImageKit>\n", argv[0]);
        return 2;
    }
    if (dlopen(argv[1], RTLD_NOW) == NULL) {
        fprintf(stderr, "dlopen(%s) failed: %s\n", argv[1], dlerror());
        return 2;
    }
    Class cls = objc_getClass("IKCacheRamNode");
    if (cls == nil) {
        fprintf(stderr, "IKCacheRamNode not found\n");
        return 1;
    }

    @autoreleasepool {
        IKCacheRamNode *r = [[cls alloc] init];
        emit(@"init|nonNil", nn(r));
        emit(@"init|parent", nn([r parent]));
        emit(@"init|session", u([r session]));
        emit(@"init|rawDataFormat", i([r rawDataFormat]));
        emit(@"init|cacheBitmap", u([r cacheUsedByBitmapRep]));
        emit(@"init|cacheJpeg", u([r cacheUsedByJpegData]));
        emit(@"init|inPriority", b([r isInPriorityList]));
        emit(@"init|bitmap", nn([r bitmap]));
        emit(@"init|data", nn([r data]));
        emit(@"init|total", u([r totalCacheUsed]));

        emit(@"nil|proxyDataFormat", i([r proxyDataFormat]));
        emit(@"nil|proxyData", nn([r proxyData]));
        emit(@"nil|proxyImage", nn([r proxyImage]));
        emit(@"nil|proxySize", size([r proxySize]));
        emit(@"nil|thumb", nn([r thumbnailWithSize:128 antialiased:YES quality:1]));
        emit(@"nil|referenceInstance", same([r proxyReferenceInstance], r));
        emit(@"nil|isVectorial", b([r isVectorial]));
        emit(@"nil|supportConcurrent", b([r supportConcurrentLoading]));

        NSObject *p = [[NSObject alloc] init];
        [r setParent:p];
        emit(@"parent|is", same([r parent], p));
        [r setSession:9];
        emit(@"session|v", u([r session]));
        [r setRawDataFormat:3];
        emit(@"rawDataFormat|v", i([r rawDataFormat]));
        [r setIsInPriorityList:YES];
        emit(@"inPriority|v", b([r isInPriorityList]));
        [r setCacheUsedByBitmapRep:100];
        [r setCacheUsedByJpegData:40];
        emit(@"cache|bitmap", u([r cacheUsedByBitmapRep]));
        emit(@"cache|jpeg", u([r cacheUsedByJpegData]));
        emit(@"cache|total", u([r totalCacheUsed]));

        NSData *data = [NSData dataWithBytes:"abc" length:3];
        [r setData:data];
        emit(@"setData|is", same([r data], data));
        emit(@"setData|proxyData", same([r proxyData], data));
        emit(@"setData|proxyFormat", i([r proxyDataFormat]));

        NSObject *bmp = [[NSObject alloc] init];
        [r setBitmap:bmp];
        emit(@"setBitmap|is", same([r bitmap], bmp));
        emit(@"setBitmap|proxyData", same([r proxyData], bmp));
        emit(@"setBitmap|proxyFormat", i([r proxyDataFormat]));

        [r setBitmap:nil];
        emit(@"clrBitmap|proxyData", same([r proxyData], data));
        emit(@"clrBitmap|proxyFormat", i([r proxyDataFormat]));
        [r setData:nil];
        emit(@"clrData|proxyData", nn([r proxyData]));
        emit(@"clrData|proxyFormat", i([r proxyDataFormat]));

        [r willDie];
        emit(@"willDie|parent", nn([r parent]));
        emit(@"willDie|total", u([r totalCacheUsed]));
    }

    return 0;
}
