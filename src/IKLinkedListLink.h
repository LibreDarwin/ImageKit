/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 */

#import <AppKit/AppKit.h>
#import "ImageKitBase.h"

@protocol IKLinkedListLinkProtocol <NSObject>
- (id)next;
- (void)setNext:(id)arg1;
- (id)previous;
- (void)setPrevious:(id)arg1;
@end

IK_CLASS_AVAILABLE(10_6)
@interface IKLinkedListLink : NSObject <IKLinkedListLinkProtocol> {
    IKLinkedListLink *_next;
    IKLinkedListLink *_previous;
}

@end
