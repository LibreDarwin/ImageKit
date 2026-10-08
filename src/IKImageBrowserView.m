/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 */

#import "IKImageBrowserView.h"

@implementation IKImageBrowserView

- (instancetype)initWithFrame:(NSRect)frameRect
{
    self = [super initWithFrame:frameRect];
    if (self)
    {
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self)
    {
    }
    return self;
}

- (void)reloadData
{
}

- (void)setNeedsDisplay
{
    [super setNeedsDisplay:YES];
}

@end
