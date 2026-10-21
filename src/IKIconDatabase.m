/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 */

#import "IKIconDatabase.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

static void _releaseIcons(const void *key, const void *value, void *context)
{
    (void)value;
    (void)context;
    ReleaseIconRef((IconRef)key);
}

@implementation IKIconDatabase

- (id)init
{
    self = [super init];
    if (self != nil) {
        _iconToIndex = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, NULL, NULL);
        _indexToIcon = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, NULL, NULL);
    }
    return self;
}

- (void)dealloc
{
    [self cleanup];
    CFRelease(_iconToIndex);
    CFRelease(_indexToIcon);
}

- (void)finalize
{
    [self cleanup];
    CFRelease(_iconToIndex);
    CFRelease(_indexToIcon);
    [super finalize];
}

- (void)cleanup
{
    CFDictionaryApplyFunction(_iconToIndex, _releaseIcons, NULL);
    CFDictionaryRemoveAllValues(_iconToIndex);
    CFDictionaryRemoveAllValues(_indexToIcon);
}

- (void)associateIconRef:(IconRef)iconRef withIndex:(unsigned long long)index
{
    if (index == NSNotFound) {
        NSLog(@"--ImageKit Error: %@", [NSString stringWithFormat:@"IKIconDatabase - associateIconRef:withIndex: bad index"]);
        return;
    }
    CFDictionarySetValue(_iconToIndex, iconRef, (const void *)(index + 1));
    CFDictionarySetValue(_indexToIcon, (const void *)(index + 1), iconRef);
    AcquireIconRef(iconRef);
}

- (IconRef)iconRefForIndex:(unsigned long long)index
{
    return (IconRef)CFDictionaryGetValue(_indexToIcon, (const void *)(index + 1));
}

- (unsigned long long)indexForIconRef:(IconRef)iconRef
{
    const void *value = CFDictionaryGetValue(_iconToIndex, iconRef);
    if (value == NULL)
        return NSNotFound;
    return (unsigned long long)value - 1;
}

- (BOOL)indexHasIconAssociated:(unsigned long long)index
{
    return CFDictionaryContainsKey(_indexToIcon, (const void *)(index + 1)) != 0;
}

- (void)removeIconCacheFromDatabaseIndex:(unsigned long long)index
{
    if (!CFDictionaryContainsKey(_indexToIcon, (const void *)(index + 1)))
        return;
    const void *iconRef = CFDictionaryGetValue(_indexToIcon, (const void *)(index + 1));
    CFDictionaryRemoveValue(_indexToIcon, (const void *)(index + 1));
    CFDictionaryRemoveValue(_iconToIndex, iconRef);
    ReleaseIconRef((IconRef)iconRef);
}

@end

#pragma clang diagnostic pop
