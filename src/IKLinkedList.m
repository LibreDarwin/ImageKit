/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 */

#import "IKLinkedList.h"

@implementation IKLinkedList

- (NSUInteger)count {
    return _count;
}

- (id)last {
    return _last;
}

- (id)first {
    return _first;
}

- (void)remove:(id)arg1 {
    if (_count == 0) {
        return;
    }
    id previous = [arg1 previous];
    id next = [arg1 next];
    [previous setNext:next];
    [next setPrevious:previous];
    [arg1 setNext:nil];
    [arg1 setPrevious:nil];
    if (_last == arg1) {
        _last = previous;
    }
    if (_first == arg1) {
        [self _setFirst:next];
    }
    _count--;
}

- (id)objectAtIndex:(NSUInteger)arg1 {
    id node = _first;
    while (arg1 != 0) {
        node = [node next];
        arg1--;
    }
    return node;
}

- (void)dealloc {
}

- (void)_setFirst:(id)arg1 {
    if (_first != arg1) {
        _first = arg1;
    }
}

- (void)addFirst:(id)arg1 {
    if (arg1 == nil) {
        return;
    }
    _count++;
    id next = nil;
    if (_first == nil) {
        _last = arg1;
    } else {
        [_first setPrevious:arg1];
        next = _first;
    }
    [arg1 setNext:next];
    [arg1 setPrevious:nil];
    [self _setFirst:arg1];
}

- (void)addLast:(id)arg1 {
    if (arg1 == nil) {
        return;
    }
    _count++;
    if (_last == nil) {
        [self _setFirst:arg1];
    } else {
        [_last setNext:arg1];
    }
    [arg1 setPrevious:_last];
    [arg1 setNext:nil];
    _last = arg1;
}

- (void)checkListConsistency {
    if (_first == nil) {
        if (_last == nil) {
            goto checkLast;
        }
        NSLog(@"--ImageKit Error: %@", [NSString stringWithFormat:@"IKLinkedList::inconsistency"]);
        if (_first == nil) {
            goto checkLast;
        }
    } else if (_last == nil) {
        NSLog(@"--ImageKit Error: %@", [NSString stringWithFormat:@"IKLinkedList::inconsistency"]);
    }
    if ([_first previous] != nil) {
        NSLog(@"--ImageKit Error: %@", [NSString stringWithFormat:@"IKLinkedList::inconsistency 2"]);
    }
checkLast:
    if (_last != nil) {
        if ([_last next] != nil) {
            NSLog(@"--ImageKit Error: %@", [NSString stringWithFormat:@"IKLinkedList::inconsistency 3"]);
        }
    }
    {
        BOOL seenLast = NO;
        NSUInteger count = 0;
        id node = _first;
        if (_first != nil) {
            do {
                BOOL isLast = (node == _last);
                BOOL newSeen = isLast || seenLast;
                if (isLast && seenLast) {
                    NSLog(@"--ImageKit Error: %@", [NSString stringWithFormat:@"IKLinkedList::inconsistency 4"]);
                    newSeen = YES;
                }
                seenLast = newSeen;
                node = [node next];
                count++;
            } while (node != nil);
        }
        if (_count != count) {
            NSLog(@"--ImageKit Error: %@", [NSString stringWithFormat:@"IKLinkedList::inconsistency 5"]);
        }
        if (_first != nil && !seenLast) {
            NSLog(@"--ImageKit Error: %@", [NSString stringWithFormat:@"IKLinkedList::inconsistency 6"]);
        }
    }
}

- (void)moveFirst:(id)arg1 {
    if (_first == arg1) {
        return;
    }
    [self remove:arg1];
    [self addFirst:arg1];
}

- (void)moveLast:(id)arg1 {
    if (_last == arg1) {
        return;
    }
    [self remove:arg1];
    [self addLast:arg1];
}

@end
