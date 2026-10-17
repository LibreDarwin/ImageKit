/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 */

#import "IKLinkedListLink.h"

@implementation IKLinkedListLink

- (id)next {
    return _next;
}

- (void)setNext:(id)arg1 {
    if (_next != arg1) {
        _next = arg1;
    }
}

- (id)previous {
    return _previous;
}

- (void)setPrevious:(id)arg1 {
    _previous = arg1;
}

- (void)dealloc {
}

@end
