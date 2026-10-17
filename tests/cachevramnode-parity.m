/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 *
 * Behavior fixture for IKCacheVRamNode. Loads the framework under test with
 * dlopen() and drives it through a fixed script, emitting one "label<TAB>value"
 * record per observation. Run against Apple's ImageKit and against ours.
 */

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <objc/runtime.h>
#import <dlfcn.h>
#import <stdio.h>

@interface IKCacheVRamNode : NSObject
- (id)parent;
- (void)setParent:(id)parent;
- (unsigned int)session;
- (void)setSession:(unsigned int)session;
- (unsigned int)memoryUsage;
- (void)setMemoryUsage:(unsigned int)memoryUsage;
- (unsigned int)packerID;
- (void)setPackerID:(unsigned int)packerID;
- (CGRect)textureRect;
- (void)setTextureRect:(CGRect)textureRect;
- (BOOL)packed;
- (void)willDie;
@end

static void emit(NSString *label, NSString *value) {
    printf("%s\t%s\n", label.UTF8String, value.UTF8String);
}

static NSString *u(unsigned int v) { return [NSString stringWithFormat:@"%u", v]; }
static NSString *b(BOOL v) { return v ? @"YES" : @"NO"; }
static NSString *same(id a, id b) { return a == b ? @"1" : @"0"; }
static NSString *nn(id o) { return o == nil ? @"nil" : @"obj"; }
static NSString *rect(CGRect r) {
    return [NSString stringWithFormat:@"%g,%g,%g,%g", r.origin.x, r.origin.y,
            r.size.width, r.size.height];
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
    Class cls = objc_getClass("IKCacheVRamNode");
    if (cls == nil) {
        fprintf(stderr, "IKCacheVRamNode not found\n");
        return 1;
    }

    @autoreleasepool {
        IKCacheVRamNode *v = [[cls alloc] init];
        emit(@"init|parent", nn([v parent]));
        emit(@"init|session", u([v session]));
        emit(@"init|memoryUsage", u([v memoryUsage]));
        emit(@"init|packerID", u([v packerID]));
        emit(@"init|packed", b([v packed]));
        emit(@"init|textureRect", rect([v textureRect]));

        NSObject *p = [[NSObject alloc] init];
        [v setParent:p];
        emit(@"setParent|is", same([v parent], p));

        [v setSession:7];
        emit(@"setSession|v", u([v session]));
        [v setMemoryUsage:1024];
        emit(@"setMemory|v", u([v memoryUsage]));
        [v setPackerID:3];
        emit(@"setPacker|v", u([v packerID]));
        emit(@"setPacker|packed", b([v packed]));
        [v setTextureRect:CGRectMake(1, 2, 3, 4)];
        emit(@"setRect|v", rect([v textureRect]));

        [v willDie];
        emit(@"willDie|parent", nn([v parent]));
        emit(@"willDie|packed", u([v packerID]));
    }

    return 0;
}
