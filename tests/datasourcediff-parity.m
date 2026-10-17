/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 *
 * Behavior fixture for IKDatasourceDiffResult. Loads the framework under test
 * with dlopen() and drives it through a fixed script, emitting one
 * "label<TAB>value" record per observation. Run against Apple's ImageKit and
 * against ours, then diff.
 */

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <dlfcn.h>
#import <stdio.h>

@interface IKDatasourceDiffResult : NSObject
- (NSMutableIndexSet *)indexesToAdd;
- (NSMutableIndexSet *)indexesToRemove;
- (BOOL)needToExchangeItems;
- (void)setNeedToExchangeItems:(BOOL)value;
- (BOOL)noDifference;
- (void)allocIndexesBuffers:(int)length;
- (void)addAddOperationWithIndex:(long)index;
- (void)addRemoveOperationWithIndex:(long)index;
- (void)addMoveOperationFrom:(long)from to:(long)to;
- (long)oldIndexOfNewIndex:(long)newIndex;
- (long)newIndexOfOldIndex:(long)oldIndex;
@end

static void emit(NSString *label, NSString *value) {
    printf("%s\t%s\n", label.UTF8String, value.UTF8String);
}

static NSString *i(int v) { return [NSString stringWithFormat:@"%d", v]; }
static NSString *lng(long v) { return [NSString stringWithFormat:@"%ld", v]; }
static NSString *ull(unsigned long long v) {
    return [NSString stringWithFormat:@"%llu", v];
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
    Class cls = objc_getClass("IKDatasourceDiffResult");
    if (cls == nil) {
        fprintf(stderr, "IKDatasourceDiffResult not found\n");
        return 1;
    }

    @autoreleasepool {
        IKDatasourceDiffResult *d = [[cls alloc] init];
        emit(@"init|addCount", ull([[d indexesToAdd] count]));
        emit(@"init|remCount", ull([[d indexesToRemove] count]));
        emit(@"init|need", i([d needToExchangeItems]));
        emit(@"init|noDiff", i([d noDifference]));

        [d addAddOperationWithIndex:5];
        emit(@"add|contains5", i([[d indexesToAdd] containsIndex:5]));
        emit(@"add|contains4", i([[d indexesToAdd] containsIndex:4]));
        emit(@"add|count", ull([[d indexesToAdd] count]));
        emit(@"add|noDiff", i([d noDifference]));

        [d addRemoveOperationWithIndex:2];
        emit(@"rem|contains2", i([[d indexesToRemove] containsIndex:2]));
        emit(@"rem|count", ull([[d indexesToRemove] count]));

        [d setNeedToExchangeItems:YES];
        emit(@"need|get", i([d needToExchangeItems]));
        emit(@"need|noDiff", i([d noDifference]));
        [d setNeedToExchangeItems:NO];
        emit(@"need|offNoDiff", i([d noDifference]));

        [d allocIndexesBuffers:10];
        emit(@"buf|identityOld3", lng([d newIndexOfOldIndex:3]));
        emit(@"buf|identityNew4", lng([d oldIndexOfNewIndex:4]));
        [d addMoveOperationFrom:3 to:7];
        emit(@"move|newOfOld3", lng([d newIndexOfOldIndex:3]));
        emit(@"move|oldOfNew7", lng([d oldIndexOfNewIndex:7]));
        emit(@"move|newOfOld5", lng([d newIndexOfOldIndex:5]));
        emit(@"move|oldOfNew5", lng([d oldIndexOfNewIndex:5]));
        [d addMoveOperationFrom:0 to:0];
        emit(@"move|newOfOld0", lng([d newIndexOfOldIndex:0]));
        emit(@"move|oldOfNew0", lng([d oldIndexOfNewIndex:0]));

        emit(@"range|oldHigh", lng([d oldIndexOfNewIndex:10]));
        emit(@"range|oldLow", lng([d oldIndexOfNewIndex:-1]));
        emit(@"range|newHigh", lng([d newIndexOfOldIndex:10]));
        emit(@"range|newLow", lng([d newIndexOfOldIndex:-1]));

        [d allocIndexesBuffers:10];
        emit(@"resize|sameNewOfOld3", lng([d newIndexOfOldIndex:3]));
        [d allocIndexesBuffers:5];
        emit(@"resize|smallerOldOfNew4", lng([d oldIndexOfNewIndex:4]));
        emit(@"resize|smallerOldOfNew3", lng([d oldIndexOfNewIndex:3]));
    }

    return 0;
}
