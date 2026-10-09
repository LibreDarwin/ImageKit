/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 */

#import "IKImageEditPanel.h"

@implementation IKImageEditPanel

+ (IKImageEditPanel *)sharedImageEditPanel
{
    static IKImageEditPanel *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}

- (void)runModal
{
}

- (void)runModalWithDelegate:(id)delegate didEndSelector:(SEL)selector contextInfo:(void *)contextInfo
{
}

- (id)dataSource
{
    return nil;
}

- (void)setDataSource:(id)dataSource
{
}
- (void)setDataSource:(id)dataSource
{
}

- (id)dataSource
{
    return nil;
}

- (void)setDelegate:(id)delegate
{
}

- (id)delegate
{
    return nil;
}
@end


- (void)setDataSource:(id)dataSource
{
}

- (id)dataSource
{
    return nil;
}

- (void)setDelegate:(id)delegate
{
}

- (id)delegate
{
    return nil;
}
