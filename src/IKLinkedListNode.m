/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 */

#import "IKLinkedListNode.h"

@implementation IKLinkedListNode

- (void)setValue:(id)arg1 {
    if (_value != arg1) {
        _value = arg1;
    }
}

- (id)value {
    return _value;
}

- (void)dealloc {
}

@end
