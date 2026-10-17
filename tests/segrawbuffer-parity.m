/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 *
 * Behavior fixture for IKSegmentedRawDataBuffer and
 * IKMultipleSegmentedRawDataBuffer. Loads the framework under test with
 * dlopen() and drives it through a fixed script, emitting one
 * "label<TAB>value" record per observation. Run against Apple's ImageKit and
 * against ours, then diff. Raw pointers are never printed; only relative
 * offsets and derived state are compared.
 */

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <dlfcn.h>
#import <stdio.h>

@interface IKSegmentedRawDataBuffer : NSObject
- (id)initWithMemorySize:(unsigned int)size;
- (void *)newSegmentOfSize:(unsigned int)size;
- (void)releaseSegment:(void *)segment ofSize:(unsigned int)size;
- (void)checkBufferSize;
- (unsigned int)totalSpace;
- (unsigned int)usedSpace;
- (int)freeSpace;
- (void)setTotalSpace:(unsigned int)size;
- (int)estimatedItemCount;
- (int)estimatedFragmentCount;
- (id)fragHandler;
- (id)cacheFragHandler;
- (void)freeCache;
- (void *)startAddress;
- (unsigned int)segmentedBufferLength;
@end

@interface IKMultipleSegmentedRawDataBuffer : NSObject
- (id)initWithMemorySize:(unsigned int)size;
- (void *)newSegmentOfSize:(unsigned int)size;
- (BOOL)containsAddress:(void *)address;
- (void)releaseSegment:(void *)segment ofSize:(unsigned int)size;
- (unsigned int)totalSpace;
- (unsigned int)usedSpace;
- (int)freeSpace;
- (void)setTotalSpace:(unsigned int)size;
- (int)estimatedItemCount;
- (int)estimatedFragmentCount;
- (void)freeCache;
- (id)segmentedBuffers;
- (id)segmentedBufferAtIndex:(int)index;
@end

static void emit(NSString *label, NSString *value) {
    printf("%s\t%s\n", label.UTF8String, value.UTF8String);
}

static NSString *boolStr(BOOL b) { return b ? @"1" : @"0"; }
static NSString *nn(id o) { return o == nil ? @"nil" : @"obj"; }
static NSString *className(id o) {
    return o == nil ? @"nil" : [NSString stringWithUTF8String:class_getName(object_getClass(o))];
}
static NSString *same(const void *a, const void *b) { return a == b ? @"1" : @"0"; }
static NSString *u(unsigned int v) { return [NSString stringWithFormat:@"%u", v]; }
static NSString *i(int v) { return [NSString stringWithFormat:@"%d", v]; }

static NSString *inside(void *seg, void *start, unsigned int len) {
    if (start == NULL || seg == NULL) return @"0";
    return (seg >= start && (char *)seg < (char *)start + len) ? @"1" : @"0";
}

static NSString *offsetOf(void *seg, void *start, unsigned int len) {
    if (start == NULL || seg == NULL || !(seg >= start && (char *)seg < (char *)start + len))
        return @"-";
    return [NSString stringWithFormat:@"%ld", (long)((char *)seg - (char *)start)];
}

static void state(IKSegmentedRawDataBuffer *b, NSString *tag) {
    emit([tag stringByAppendingString:@"|totalSpace"], u([b totalSpace]));
    emit([tag stringByAppendingString:@"|usedSpace"], u([b usedSpace]));
    emit([tag stringByAppendingString:@"|freeSpace"], i([b freeSpace]));
    emit([tag stringByAppendingString:@"|itemCount"], i([b estimatedItemCount]));
    emit([tag stringByAppendingString:@"|fragCount"], i([b estimatedFragmentCount]));
    emit([tag stringByAppendingString:@"|bufLen"], u([b segmentedBufferLength]));
    emit([tag stringByAppendingString:@"|startNil"], nn([b startAddress]));
}

static void overheadScenario(void) {
    Class cls = objc_getClass("IKSegmentedRawDataBuffer");
    unsigned int sizes[] = { 1, 7, 10, 100, 333, 1000, 10000 };
    for (unsigned int s = 0; s < sizeof(sizes) / sizeof(sizes[0]); s++) {
        IKSegmentedRawDataBuffer *b = [[cls alloc] initWithMemorySize:sizes[s]];
        NSString *tag = [NSString stringWithFormat:@"ovh%u", sizes[s]];
        emit([tag stringByAppendingString:@"|lenBefore"], u([b segmentedBufferLength]));
        emit([tag stringByAppendingString:@"|totalBefore"], u([b totalSpace]));
        [b newSegmentOfSize:1];
        emit([tag stringByAppendingString:@"|lenAfter"], u([b segmentedBufferLength]));
    }
}

static void segmentedScenario(void) {
    Class cls = objc_getClass("IKSegmentedRawDataBuffer");
    IKSegmentedRawDataBuffer *b = [[cls alloc] initWithMemorySize:1000];
    state(b, @"s0");

    emit(@"s0|fragEqCache", boolStr([b fragHandler] == [b cacheFragHandler]));
    emit(@"s0|fragCls", className([b fragHandler]));

    void *s1 = [b newSegmentOfSize:100];
    state(b, @"s1");
    void *start = [b startAddress];
    unsigned int len = [b segmentedBufferLength];
    emit(@"s1|inside", inside(s1, start, len));
    emit(@"s1|offset", offsetOf(s1, start, len));

    void *s2 = [b newSegmentOfSize:200];
    state(b, @"s2");
    emit(@"s2|offset1", offsetOf(s1, start, len));
    emit(@"s2|offset2", offsetOf(s2, start, len));
    emit(@"s2|distinct", same(s1, s2));

    void *s3 = [b newSegmentOfSize:5000];
    state(b, @"s3");
    emit(@"s3|inside", inside(s3, [b startAddress], [b segmentedBufferLength]));

    [b releaseSegment:s3 ofSize:5000];
    state(b, @"s3released");

    [b releaseSegment:s1 ofSize:100];
    state(b, @"s1released");

    [b releaseSegment:s2 ofSize:200];
    state(b, @"s2released");

    [b setTotalSpace:4000];
    state(b, @"set4000");

    void *s4 = [b newSegmentOfSize:1000];
    state(b, @"s4");
    emit(@"s4|offset", offsetOf(s4, [b startAddress], [b segmentedBufferLength]));

    [b freeCache];
    state(b, @"freed");
}

static void multipleScenario(void) {
    Class cls = objc_getClass("IKMultipleSegmentedRawDataBuffer");
    Class segCls = objc_getClass("IKSegmentedRawDataBuffer");
    IKMultipleSegmentedRawDataBuffer *m = [[cls alloc] initWithMemorySize:1000];

    emit(@"m0|totalSpace", u([m totalSpace]));
    emit(@"m0|usedSpace", u([m usedSpace]));
    emit(@"m0|freeSpace", i([m freeSpace]));
    emit(@"m0|itemCount", i([m estimatedItemCount]));
    emit(@"m0|fragCount", i([m estimatedFragmentCount]));
    emit(@"m0|bufCount", [NSString stringWithFormat:@"%lu", (unsigned long)[[m segmentedBuffers] count]]);
    emit(@"m0|buf0Cls", className([m segmentedBufferAtIndex:0]));
    emit(@"m0|buf0IsSeg", boolStr(object_getClass([m segmentedBufferAtIndex:0]) == segCls));
    emit(@"m0|buf0StartNil", nn([[m segmentedBufferAtIndex:0] startAddress]));
    emit(@"m0|buf5Nil", nn([m segmentedBufferAtIndex:5]));
    emit(@"m0|bufNegNil", nn([m segmentedBufferAtIndex:-1]));

    void *s1 = [m newSegmentOfSize:100];
    emit(@"m1|containsS1", boolStr([m containsAddress:s1]));
    emit(@"m1|containsNil", boolStr([m containsAddress:NULL]));
    void *start0 = [[m segmentedBufferAtIndex:0] startAddress];
    unsigned int len0 = [[m segmentedBufferAtIndex:0] segmentedBufferLength];
    emit(@"m1|offset", offsetOf(s1, start0, len0));
    emit(@"m1|usedSpace", u([m usedSpace]));
    emit(@"m1|freeSpace", i([m freeSpace]));
    emit(@"m1|itemCount", i([m estimatedItemCount]));
    emit(@"m1|fragCount", i([m estimatedFragmentCount]));

    void *s2 = [m newSegmentOfSize:300];
    emit(@"m2|offset", offsetOf(s2, start0, len0));
    emit(@"m2|distinct", same(s1, s2));
    emit(@"m2|usedSpace", u([m usedSpace]));
    emit(@"m2|freeSpace", i([m freeSpace]));
    emit(@"m2|itemCount", i([m estimatedItemCount]));
    emit(@"m2|fragCount", i([m estimatedFragmentCount]));

    void *s3 = [m newSegmentOfSize:5000];
    emit(@"m3|containsS3", boolStr([m containsAddress:s3]));
    emit(@"m3|bufCount", [NSString stringWithFormat:@"%lu", (unsigned long)[[m segmentedBuffers] count]]);
    emit(@"m3|totalSpace", u([m totalSpace]));
    emit(@"m3|usedSpace", u([m usedSpace]));
    emit(@"m3|freeSpace", i([m freeSpace]));
    emit(@"m3|itemCount", i([m estimatedItemCount]));
    emit(@"m3|fragCount", i([m estimatedFragmentCount]));

    [m releaseSegment:s1 ofSize:100];
    emit(@"m4|bufCount", [NSString stringWithFormat:@"%lu", (unsigned long)[[m segmentedBuffers] count]]);
    emit(@"m4|usedSpace", u([m usedSpace]));
    emit(@"m4|freeSpace", i([m freeSpace]));
    emit(@"m4|itemCount", i([m estimatedItemCount]));
    emit(@"m4|fragCount", i([m estimatedFragmentCount]));

    [m releaseSegment:s2 ofSize:300];
    emit(@"m5|bufCount", [NSString stringWithFormat:@"%lu", (unsigned long)[[m segmentedBuffers] count]]);
    emit(@"m5|usedSpace", u([m usedSpace]));
    emit(@"m5|freeSpace", i([m freeSpace]));
    emit(@"m5|itemCount", i([m estimatedItemCount]));
    emit(@"m5|fragCount", i([m estimatedFragmentCount]));
    emit(@"m5|buf0Cls", className([m segmentedBufferAtIndex:0]));

    int stackSentinel = 0;
    unsigned int usedBefore = [m usedSpace];
    [m releaseSegment:&stackSentinel ofSize:4];
    emit(@"m6|usedUnchanged", boolStr([m usedSpace] == usedBefore));

    [m setTotalSpace:4000];
    emit(@"m7|totalSpace", u([m totalSpace]));
    emit(@"m7|usedSpace", u([m usedSpace]));
    emit(@"m7|freeSpace", i([m freeSpace]));
    emit(@"m7|itemCount", i([m estimatedItemCount]));
    emit(@"m7|fragCount", i([m estimatedFragmentCount]));

    void *s4 = [m newSegmentOfSize:200];
    emit(@"m8|newSegNonNil", boolStr(s4 != NULL));
    emit(@"m8|bufCount", [NSString stringWithFormat:@"%lu", (unsigned long)[[m segmentedBuffers] count]]);
    emit(@"m8|usedSpace", u([m usedSpace]));
    emit(@"m8|itemCount", i([m estimatedItemCount]));
    emit(@"m8|fragCount", i([m estimatedFragmentCount]));

    [m freeCache];
    emit(@"m9|bufCount", [NSString stringWithFormat:@"%lu", (unsigned long)[[m segmentedBuffers] count]]);
    emit(@"m9|totalSpace", u([m totalSpace]));
    emit(@"m9|usedSpace", u([m usedSpace]));
    emit(@"m9|itemCount", i([m estimatedItemCount]));
    emit(@"m9|fragCount", i([m estimatedFragmentCount]));
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
    if (objc_getClass("IKSegmentedRawDataBuffer") == nil) {
        fprintf(stderr, "IKSegmentedRawDataBuffer not found\n");
        return 1;
    }

    overheadScenario();
    segmentedScenario();
    multipleScenario();

    return 0;
}
