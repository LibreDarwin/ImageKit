/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 *
 * Behavior fixture for IKGLTextCacheFragHandler. Loads the framework under
 * test with dlopen() and drives it through a fixed script, emitting one
 * "label<TAB>value..." record per observation. Run against Apple's ImageKit
 * and against ours, then diff.
 */

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>
#import <dlfcn.h>
#import <stdio.h>

@interface IKGLTextCacheFragHandler : NSObject
- (id)initWithSize:(CGSize)size;
- (void)reset;
- (void)resetCacheWithSize:(CGSize)size;
- (CGRect)allocateSize:(CGSize)size;
- (BOOL)canAllocateSize:(CGSize)size;
- (BOOL)freeRect:(CGRect)rect;
- (CGRect)boundingRectOfUsedSpace;
- (int)maxLineHeight;
- (void)setMaxLineHeight:(int)height;
- (id)fragHandler;
@end

@interface IKCacheFragHandler : NSObject
- (float)frag;
- (unsigned long long)totalLen;
@end

static void emit(NSString *label, NSString *value) {
    printf("%s\t%s\n", label.UTF8String, value.UTF8String);
}

static NSString *R(CGRect r) {
    return [NSString stringWithFormat:@"%.6f,%.6f,%.6f,%.6f",
            r.origin.x, r.origin.y, r.size.width, r.size.height];
}

static NSString *S(CGSize s) {
    return [NSString stringWithFormat:@"%.6f,%.6f", s.width, s.height];
}

static void state(id cache, NSString *tag) {
    emit([tag stringByAppendingString:@"|mlh"],
         [NSString stringWithFormat:@"%d", [cache maxLineHeight]]);
    emit([tag stringByAppendingString:@"|fh"],
         [cache fragHandler] != nil ? @"1" : @"0");
    emit([tag stringByAppendingString:@"|frag"],
         [NSString stringWithFormat:@"%.6f", [[cache fragHandler] frag]]);
    emit([tag stringByAppendingString:@"|total"],
         [NSString stringWithFormat:@"%llu", [[cache fragHandler] totalLen]]);
    emit([tag stringByAppendingString:@"|bound"], R([cache boundingRectOfUsedSpace]));
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
    Class cls = objc_getClass("IKGLTextCacheFragHandler");
    if (cls == nil) {
        fprintf(stderr, "IKGLTextCacheFragHandler not found\n");
        return 1;
    }

    CGSize sizes[] = {
        {256, 200}, {512, 512}, {100, 100}, {64, 80},
        {300, 120}, {0, 0}, {10, 5}, {40, 7}, {256, 40},
    };
    unsigned nsizes = sizeof(sizes) / sizeof(sizes[0]);

    for (unsigned s = 0; s < nsizes; s++) {
        CGFloat W = sizes[s].width, H = sizes[s].height;
        id cache = [[objc_getClass("IKGLTextCacheFragHandler") alloc] initWithSize:sizes[s]];
        NSString *tag = [NSString stringWithFormat:@"init:%gx%g", W, H];

        state(cache, tag);

        double reqs[] = {1, 5, W * 0.25, W * 0.5, W - 2, W - 1, W, 200};
        unsigned nreqs = sizeof(reqs) / sizeof(reqs[0]);
        for (unsigned q = 0; q < nreqs; q++) {
            CGFloat rw = reqs[q];
            if (rw < 0) continue;
            CGSize req = CGSizeMake(rw, 10);
            NSString *rtag = [tag stringByAppendingFormat:@"|req:%g", rw];

            emit([rtag stringByAppendingString:@"|can"],
                 [cache canAllocateSize:req] ? @"1" : @"0");
            CGRect rect = [cache allocateSize:req];
            emit([rtag stringByAppendingString:@"|alloc"], R(rect));
            emit([rtag stringByAppendingString:@"|bound"], R([cache boundingRectOfUsedSpace]));
            emit([rtag stringByAppendingString:@"|frag"],
                 [NSString stringWithFormat:@"%.6f", [[cache fragHandler] frag]]);
            emit([rtag stringByAppendingString:@"|free"],
                 [cache freeRect:rect] ? @"1" : @"0");
            emit([rtag stringByAppendingString:@"|can2"],
                 [cache canAllocateSize:req] ? @"1" : @"0");
        }

        emit([tag stringByAppendingString:@"|reset|bound0"], R([cache boundingRectOfUsedSpace]));
        [cache reset];
        emit([tag stringByAppendingString:@"|reset|bound1"], R([cache boundingRectOfUsedSpace]));
        emit([tag stringByAppendingString:@"|reset|frag"],
             [NSString stringWithFormat:@"%.6f", [[cache fragHandler] frag]]);

        [cache setMaxLineHeight:7];
        emit([tag stringByAppendingString:@"|mlh7"], [NSString stringWithFormat:@"%d", [cache maxLineHeight]]);
        emit([tag stringByAppendingString:@"|mlh7|bound"], R([cache boundingRectOfUsedSpace]));

        [cache setMaxLineHeight:20];
        CGSize bigger = CGSizeMake(W * 2 + 4, H * 2 + 4);
        [cache resetCacheWithSize:bigger];
        emit([tag stringByAppendingString:@"|reinit"],
             [NSString stringWithFormat:@"%@:%@", S(bigger), R([cache boundingRectOfUsedSpace])]);
        emit([tag stringByAppendingString:@"|reinit|frag"],
             [NSString stringWithFormat:@"%.6f", [[cache fragHandler] frag]]);
    }

    return 0;
}
