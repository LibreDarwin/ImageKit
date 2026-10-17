/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 *
 * Behavior fixture for IKAnimationData. Loads the framework under test with
 * dlopen() and drives it through a fixed script, emitting one "label<TAB>value"
 * record per observation. Run against Apple's ImageKit and against ours, then
 * diff.
 *
 * Compiled without ARC. Absolute retain/release counts are not compared (ARC
 * emits different retain/release traffic than the framework's original MRC
 * code), but the values stored and released are, including how many times each
 * object is released when the receiver deallocates.
 */

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <dlfcn.h>
#import <stdio.h>

@interface IKAnimationData : NSObject
- (id)initialValue;
- (void)setInitialValue:(id)value;
- (id)finalValue;
- (void)setFinalValue:(id)value;
- (id)currentValue;
- (void)setCurrentValue:(id)value;
@end

@interface Counter : NSObject {
    int _releases;
}
- (int)releases;
@end

@implementation Counter
- (oneway void)release {
    _releases++;
    [super release];
}
- (int)releases { return _releases; }
@end

static void emit(NSString *label, NSString *value) {
    printf("%s\t%s\n", label.UTF8String, value.UTF8String);
}

static NSString *i(int v) { return [NSString stringWithFormat:@"%d", v]; }
static NSString *same(id a, id b) { return a == b ? @"1" : @"0"; }
static NSString *nn(id o) { return o == nil ? @"nil" : @"obj"; }

int main(int argc, char **argv) {
    if (argc != 2) {
        fprintf(stderr, "usage: %s <path to ImageKit>\n", argv[0]);
        return 2;
    }
    if (dlopen(argv[1], RTLD_NOW) == NULL) {
        fprintf(stderr, "dlopen(%s) failed: %s\n", argv[1], dlerror());
        return 2;
    }
    Class cls = objc_getClass("IKAnimationData");
    if (cls == nil) {
        fprintf(stderr, "IKAnimationData not found\n");
        return 1;
    }

    IKAnimationData *d = [[cls alloc] init];
    emit(@"init|initialNil", nn([d initialValue]));
    emit(@"init|finalNil", nn([d finalValue]));
    emit(@"init|currentNil", nn([d currentValue]));

    Counter *a = [[Counter alloc] init];
    Counter *b = [[Counter alloc] init];

    [d setInitialValue:a];
    emit(@"setA|initialIsA", same([d initialValue], a));
    [d setInitialValue:a];
    emit(@"setA2|initialIsA", same([d initialValue], a));
    [d setInitialValue:b];
    emit(@"setB|initialIsB", same([d initialValue], b));
    emit(@"setB|finalStillNil", nn([d finalValue]));
    emit(@"setB|currentStillNil", nn([d currentValue]));

    [d setFinalValue:a];
    emit(@"finalA|finalIsA", same([d finalValue], a));
    [d setFinalValue:b];
    emit(@"finalB|finalIsB", same([d finalValue], b));

    [d setCurrentValue:a];
    emit(@"curA|currentIsA", same([d currentValue], a));
    [d setCurrentValue:b];
    emit(@"curB|currentIsB", same([d currentValue], b));

    [d setInitialValue:nil];
    emit(@"setNil|initialNil", nn([d initialValue]));
    [d setFinalValue:nil];
    emit(@"setNil|finalNil", nn([d finalValue]));

    [d setInitialValue:a];
    [d setFinalValue:b];
    emit(@"restore|initialIsA", same([d initialValue], a));
    emit(@"restore|finalIsB", same([d finalValue], b));
    emit(@"restore|currentIsB", same([d currentValue], b));

    int aRelBefore = [a releases];
    int bRelBefore = [b releases];
    [d release];
    emit(@"dealloc|aRelDelta", i([a releases] - aRelBefore));
    emit(@"dealloc|bRelDelta", i([b releases] - bRelBefore));

    return 0;
}
