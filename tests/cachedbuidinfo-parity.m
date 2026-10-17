/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 *
 * Behavior fixture for IKCacheDatabaseUIDInfo. Loads the framework under test
 * with dlopen() and drives it through a fixed script, emitting one
 * "label<TAB>value" record per observation. Run against Apple's ImageKit and
 * against ours, then diff.
 */

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <dlfcn.h>
#import <stdio.h>

@interface IKCacheDatabaseUIDInfo : NSObject
- (id)image;
- (void)setImage:(id)value;
- (unsigned long long)version;
- (void)setVersion:(unsigned long long)value;
- (unsigned long long)index;
- (void)setIndex:(unsigned long long)value;
- (BOOL)isValid;
- (void)setIsValid:(BOOL)value;
@end

static void emit(NSString *label, NSString *value) {
    printf("%s\t%s\n", label.UTF8String, value.UTF8String);
}

static NSString *i(int v) { return [NSString stringWithFormat:@"%d", v]; }
static NSString *ull(unsigned long long v) {
    return [NSString stringWithFormat:@"%llu", v];
}
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
    Class cls = objc_getClass("IKCacheDatabaseUIDInfo");
    if (cls == nil) {
        fprintf(stderr, "IKCacheDatabaseUIDInfo not found\n");
        return 1;
    }

    IKCacheDatabaseUIDInfo *info = [[cls alloc] init];
    emit(@"init|imageNil", nn([info image]));
    emit(@"init|versionZero", ull([info version]) == 0 ? @"1" : @"0");
    emit(@"init|indexZero", ull([info index]) == 0 ? @"1" : @"0");
    emit(@"init|isValid", i([info isValid]));

    NSObject *a = [[NSObject alloc] init];
    NSObject *b = [[NSObject alloc] init];

    [info setImage:a];
    emit(@"imageA|isA", same([info image], a));
    [info setImage:a];
    emit(@"imageA2|isA", same([info image], a));
    [info setImage:b];
    emit(@"imageB|isB", same([info image], b));
    [info setImage:nil];
    emit(@"imageNil2|nil", nn([info image]));

    [info setVersion:42];
    emit(@"version|42", ull([info version]));
    [info setVersion:18446744073709551615ULL];
    emit(@"version|max", ull([info version]));
    [info setVersion:0];
    emit(@"version|zero", ull([info version]));

    [info setIndex:7];
    emit(@"index|7", ull([info index]));
    [info setIndex:18446744073709551615ULL];
    emit(@"index|max", ull([info index]));

    [info setIsValid:NO];
    emit(@"valid|no", i([info isValid]));
    [info setIsValid:YES];
    emit(@"valid|yes", i([info isValid]));
    [info setIsValid:NO];
    [info setIsValid:NO];
    emit(@"valid|nono", i([info isValid]));

    return 0;
}
