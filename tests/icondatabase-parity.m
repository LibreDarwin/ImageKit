/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 *
 * Behavior fixture for IKIconDatabase. Loads the framework under test with
 * dlopen() and drives it through a fixed script, emitting one "label<TAB>value"
 * record per observation. Run against Apple's ImageKit and against ours.
 */

#import <Foundation/Foundation.h>
#import <CoreServices/CoreServices.h>
#import <objc/runtime.h>
#import <dlfcn.h>
#import <stdio.h>

#pragma clang diagnostic ignored "-Wdeprecated-declarations"

@interface IKIconDatabase : NSObject
- (id)init;
- (void)cleanup;
- (void)associateIconRef:(IconRef)iconRef withIndex:(unsigned long long)index;
- (IconRef)iconRefForIndex:(unsigned long long)index;
- (unsigned long long)indexForIconRef:(IconRef)iconRef;
- (BOOL)indexHasIconAssociated:(unsigned long long)index;
- (void)removeIconCacheFromDatabaseIndex:(unsigned long long)index;
@end

static void emit(NSString *label, NSString *value) {
    printf("%s\t%s\n", label.UTF8String, value.UTF8String);
}

static NSString *u(unsigned long long v) { return [NSString stringWithFormat:@"%llu", v]; }
static NSString *b(BOOL v) { return v ? @"YES" : @"NO"; }
static NSString *nref(IconRef r) { return r == NULL ? @"NULL" : @"nonNULL"; }
static NSString *same(IconRef a, IconRef b) { return a == b ? @"1" : @"0"; }

int main(int argc, char **argv) {
    if (argc != 2) {
        fprintf(stderr, "usage: %s <path to ImageKit>\n", argv[0]);
        return 2;
    }
    if (dlopen(argv[1], RTLD_NOW) == NULL) {
        fprintf(stderr, "dlopen(%s) failed: %s\n", argv[1], dlerror());
        return 2;
    }
    Class cls = objc_getClass("IKIconDatabase");
    if (cls == nil) {
        fprintf(stderr, "IKIconDatabase not found\n");
        return 1;
    }

    @autoreleasepool {
        IKIconDatabase *db = [[cls alloc] init];
        emit(@"init|nonNil", db == nil ? @"nil" : @"obj");

        IconRef bogus = (IconRef)0x1234;
        emit(@"empty|iconRefForIndex", nref([db iconRefForIndex:0]));
        emit(@"empty|indexForIconRef", u([db indexForIconRef:bogus]));
        emit(@"empty|hasIcon0", b([db indexHasIconAssociated:0]));
        emit(@"empty|hasIcon99", b([db indexHasIconAssociated:99]));

        [db removeIconCacheFromDatabaseIndex:0];
        emit(@"removeUnknown|hasIcon0", b([db indexHasIconAssociated:0]));
        [db associateIconRef:bogus withIndex:NSNotFound];
        emit(@"assocBadIndex|done", @"ok");

        [db cleanup];
        emit(@"cleanupEmpty|done", @"ok");

        IconRef ref = NULL;
        OSStatus st = GetIconRef((SInt16)-32768, 'macs', 'Fldr', &ref);
        emit(@"getref|ok", (st == 0 && ref != NULL) ? @"YES" : @"NO");

        if (ref != NULL) {
            [db associateIconRef:ref withIndex:5];
            emit(@"assoc|indexForIconRef", u([db indexForIconRef:ref]));
            emit(@"assoc|iconRefForIndex", same([db iconRefForIndex:5], ref));
            emit(@"assoc|hasIcon5", b([db indexHasIconAssociated:5]));
            emit(@"assoc|hasIcon4", b([db indexHasIconAssociated:4]));
            emit(@"assoc|iconRefForIndex4", nref([db iconRefForIndex:4]));

            [db removeIconCacheFromDatabaseIndex:5];
            emit(@"remove|hasIcon5", b([db indexHasIconAssociated:5]));
            emit(@"remove|indexForIconRef", u([db indexForIconRef:ref]));

            [db associateIconRef:ref withIndex:7];
            emit(@"assoc2|hasIcon7", b([db indexHasIconAssociated:7]));
            [db cleanup];
            emit(@"cleanup|hasIcon7", b([db indexHasIconAssociated:7]));
            emit(@"cleanup|indexForIconRef", u([db indexForIconRef:ref]));
            ReleaseIconRef(ref);
        }
    }

    return 0;
}
