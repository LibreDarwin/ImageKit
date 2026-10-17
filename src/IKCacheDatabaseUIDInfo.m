/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 */

#import "IKCacheDatabaseUIDInfo.h"

@implementation IKCacheDatabaseUIDInfo

- (IKImageWrapper *)image
{
    return _image;
}

- (void)setImage:(IKImageWrapper *)image
{
    if (_image != image)
        _image = image;
}

- (unsigned long long)version
{
    return _version;
}

- (void)setVersion:(unsigned long long)version
{
    _version = version;
}

- (unsigned long long)index
{
    return _index;
}

- (void)setIndex:(unsigned long long)index
{
    _index = index;
}

- (BOOL)isValid
{
    return _invalid ^ 1;
}

- (void)setIsValid:(BOOL)valid
{
    _invalid = valid ^ 1;
}

- (void)dealloc
{
}

@end
