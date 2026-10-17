/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 */

#import "IKAnimationData.h"

@implementation IKAnimationData

- (id)initialValue
{
    return _initialValue;
}

- (void)setInitialValue:(id)value
{
    if (_initialValue != value)
        _initialValue = value;
}

- (id)finalValue
{
    return _finalValue;
}

- (void)setFinalValue:(id)value
{
    if (_finalValue != value)
        _finalValue = value;
}

- (id)currentValue
{
    return _currentValue;
}

- (void)setCurrentValue:(id)value
{
    if (_currentValue != value)
        _currentValue = value;
}

- (void)dealloc
{
}

@end
