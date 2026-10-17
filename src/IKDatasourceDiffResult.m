/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 */

#import "IKDatasourceDiffResult.h"

#include <stdlib.h>

@implementation IKDatasourceDiffResult

- (id)init
{
    self = [super init];
    if (self) {
        indexesToAdd = [[NSMutableIndexSet alloc] init];
        indexesToRemove = [[NSMutableIndexSet alloc] init];
    }
    return self;
}

- (void)dealloc
{
    if (_oldIndexToNewIndex != NULL)
        free(_oldIndexToNewIndex);
    if (_newIndexToOldIndex != NULL)
        free(_newIndexToOldIndex);
}

- (void)finalize
{
    if (_oldIndexToNewIndex != NULL)
        free(_oldIndexToNewIndex);
    if (_newIndexToOldIndex != NULL)
        free(_newIndexToOldIndex);
    [super finalize];
}

- (NSMutableIndexSet *)indexesToAdd
{
    return indexesToAdd;
}

- (NSMutableIndexSet *)indexesToRemove
{
    return indexesToRemove;
}

- (BOOL)needToExchangeItems
{
    return _needToExchangeItems;
}

- (BOOL)noDifference
{
    if (_needToExchangeItems & 1)
        return NO;
    if ([indexesToAdd count] == 0)
        return [indexesToRemove count] == 0;
    return NO;
}

- (long)oldIndexOfNewIndex:(long)newIndex
{
    if (_newIndexToOldIndex != NULL && newIndex >= 0 && newIndex < _indexBufferLength) {
        unsigned long v = (unsigned long)_newIndexToOldIndex[newIndex];
        if ((v & 0xffffffffUL) != 0)
            newIndex = (long)((int)v - 1);
    }
    return newIndex;
}

- (long)newIndexOfOldIndex:(long)oldIndex
{
    if (_oldIndexToNewIndex != NULL && oldIndex >= 0 && oldIndex < _indexBufferLength) {
        unsigned long v = (unsigned long)_oldIndexToNewIndex[oldIndex];
        if ((v & 0xffffffffUL) != 0)
            oldIndex = (long)((int)v - 1);
    }
    return oldIndex;
}

@end
