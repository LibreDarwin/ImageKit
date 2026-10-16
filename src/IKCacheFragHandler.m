/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 */

#import "IKCacheFragHandler.h"
#import "IKCacheFragHandler_Hole.h"

#define IK_CFH_RANK_COUNT 30

static unsigned int IKCacheFragHandlerRankOfLen(unsigned long long len)
{
    unsigned int rank;

    if (len == 0)
        return 0;
    rank = 64 - (unsigned int)__builtin_clzll(len);
    if (rank > 0x1c)
        rank = 0x1d;
    return rank;
}

static NSUInteger IKCacheFragHandlerUpperBound(NSArray *holes, unsigned long long pos)
{
    NSUInteger lo = 0;
    NSUInteger hi = [holes count];

    while (hi > lo) {
        NSUInteger mid = lo + (hi - lo) / 2;
        if ([(IKCacheFragHandler_Hole *)[holes objectAtIndex:mid] start] > pos)
            hi = mid;
        else
            lo = mid + 1;
    }
    return lo;
}

@interface IKCacheFragHandler ()
- (void)commonInitWithDictionary:(NSDictionary *)dict;
- (void)_insertHoleInRanks:(IKCacheFragHandler_Hole *)hole;
- (void)_removeHoleFromRanks:(IKCacheFragHandler_Hole *)hole;
@end

@implementation IKCacheFragHandler

- (id)init
{
    if ((self = [super init]) != nil) {
        _path = nil;
        _sizeRanks = (__strong id *)calloc(IK_CFH_RANK_COUNT, sizeof(id));
        for (unsigned int i = 0; i < IK_CFH_RANK_COUNT; i++)
            _sizeRanks[i] = [[NSMutableArray alloc] initWithCapacity:10];
        _orderedByStart = [[NSMutableArray alloc] init];
        _isDirty = NO;
        _totalLen = 0;
        _holesLen = 0;
    }
    return self;
}

- (id)initWithFilePath:(NSString *)path
{
    if ((self = [super init]) != nil) {
        _path = [path copy];
        _sizeRanks = (__strong id *)calloc(IK_CFH_RANK_COUNT, sizeof(id));
        for (unsigned int i = 0; i < IK_CFH_RANK_COUNT; i++)
            _sizeRanks[i] = [[NSMutableArray alloc] initWithCapacity:10];
        _orderedByStart = [[NSMutableArray alloc] init];
        if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
            _totalLen = 0;
            _holesLen = 0;
            _isDirty = YES;
        } else {
            NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
            [self commonInitWithDictionary:dict];
        }
    }
    return self;
}

- (id)initWithDictionary:(NSDictionary *)dict
{
    if ((self = [super init]) != nil) {
        _path = nil;
        _sizeRanks = (__strong id *)calloc(IK_CFH_RANK_COUNT, sizeof(id));
        for (unsigned int i = 0; i < IK_CFH_RANK_COUNT; i++)
            _sizeRanks[i] = [[NSMutableArray alloc] initWithCapacity:10];
        _orderedByStart = [[NSMutableArray alloc] init];
        [self commonInitWithDictionary:dict];
    }
    return self;
}

- (void)commonInitWithDictionary:(NSDictionary *)dict
{
    NSArray *posArray = [dict objectForKey:@"orderedHolesPos"];
    NSArray *lenArray = [dict objectForKey:@"orderedHolesLen"];
    NSUInteger count = [posArray count];

    for (NSUInteger i = 0; i < count; i++) {
        unsigned long long start = [[posArray objectAtIndex:i] unsignedLongLongValue];
        unsigned long long length = [[lenArray objectAtIndex:i] unsignedLongLongValue];
        IKCacheFragHandler_Hole *hole = [IKCacheFragHandler_Hole holeWithStart:start len:length];
        [_orderedByStart addObject:hole];
        [self _insertHoleInRanks:hole];
    }
    _totalLen = [[dict objectForKey:@"totalLen"] unsignedLongLongValue];
    _holesLen = [[dict objectForKey:@"holesLen"] unsignedLongLongValue];
}

- (void)dealloc
{
    free((void *)_sizeRanks);
}

- (void)clear
{
    for (unsigned int i = 0; i < IK_CFH_RANK_COUNT; i++)
        [(NSMutableArray *)_sizeRanks[i] removeAllObjects];
    [_orderedByStart removeAllObjects];
    _totalLen = 0;
    _holesLen = 0;
    _isDirty = YES;
}

- (void)_insertHoleInRanks:(IKCacheFragHandler_Hole *)hole
{
    unsigned int rank = IKCacheFragHandlerRankOfLen([hole len]);
    NSMutableArray *bucket = _sizeRanks[rank];
    unsigned long long holeLen = [hole len];
    NSUInteger count = [bucket count];
    NSUInteger index = count;

    for (NSUInteger i = 0; i < count; i++) {
        if ([[bucket objectAtIndex:i] len] <= holeLen) {
            index = i;
            break;
        }
    }
    [bucket insertObject:hole atIndex:index];
}

- (void)_removeHoleFromRanks:(IKCacheFragHandler_Hole *)hole
{
    unsigned int rank = IKCacheFragHandlerRankOfLen([hole len]);

    [(NSMutableArray *)_sizeRanks[rank] removeObject:hole];
}

- (BOOL)canFindHoleForLen:(unsigned long long)len
{
    unsigned int rank = IKCacheFragHandlerRankOfLen(len);

    for (unsigned int i = rank; i < IK_CFH_RANK_COUNT; i++) {
        NSMutableArray *bucket = _sizeRanks[i];
        if ([bucket count] != 0) {
            if ([[bucket objectAtIndex:0] len] >= len)
                return YES;
        }
    }
    return NO;
}

- (unsigned long long)allocateSpaceForLen:(unsigned long long)len added:(BOOL *)added
{
    unsigned int rank = IKCacheFragHandlerRankOfLen(len);

    for (unsigned int i = rank; i < IK_CFH_RANK_COUNT; i++) {
        NSMutableArray *bucket = _sizeRanks[i];
        NSUInteger count = [bucket count];
        if (count == 0)
            continue;
        if ([[bucket objectAtIndex:0] len] < len)
            continue;

        NSUInteger best = 0;
        for (NSUInteger j = 0; j < count; j++) {
            if ([[bucket objectAtIndex:j] len] >= len)
                best = j;
            else
                break;
        }

        IKCacheFragHandler_Hole *hole = [bucket objectAtIndex:best];
        unsigned long long holeLen = [hole len];
        unsigned long long holeStart = [hole start];

        [bucket removeObject:hole];
        if (len < holeLen) {
            [hole setStart:holeStart + len len:holeLen - len];
            [self _insertHoleInRanks:hole];
        } else {
            [_orderedByStart removeObject:hole];
        }
        *added = NO;
        _holesLen -= len;
        _isDirty = YES;
        return holeStart;
    }

    *added = YES;
    {
        unsigned long long oldTotalLen = _totalLen;
        _totalLen = oldTotalLen + len;
        _isDirty = YES;
        return oldTotalLen;
    }
}

- (void)releaseSpaceAtPos:(unsigned long long)pos withLen:(unsigned long long)len
{
    NSUInteger n = [_orderedByStart count];
    NSUInteger ub = IKCacheFragHandlerUpperBound(_orderedByStart, pos);
    IKCacheFragHandler_Hole *prev = nil;
    IKCacheFragHandler_Hole *next = nil;
    IKCacheFragHandler_Hole *newHole = nil;

    if (ub == 0) {
        if (n <= 1)
            goto newHoleLabel;
    } else {
        IKCacheFragHandler_Hole *p = [_orderedByStart objectAtIndex:ub - 1];
        unsigned long long pEnd = [p start] + [p len];
        BOOL leftMerge = (pos == pEnd);

        if (pos >= pEnd && n - 1 > ub) {
            prev = leftMerge ? p : nil;
            goto handleNextLabel;
        }
        if (!leftMerge)
            goto newHoleLabel;
        [self _removeHoleFromRanks:p];
        [p setStart:[p start] len:[p len] + len];
        prev = p;
        goto mergePrevLabel;
    }

handleNextLabel:
    next = [_orderedByStart objectAtIndex:ub];
    {
        BOOL rightMerge = (pos + len == [next start]);

        if (prev != nil) {
            [self _removeHoleFromRanks:prev];
            if (rightMerge) {
                unsigned long long s = [prev start];
                unsigned long long newLen = [prev len] + len + [next len];
                [prev setStart:s len:newLen];
                [self _removeHoleFromRanks:next];
                [_orderedByStart removeObject:next];
            } else {
                [prev setStart:[prev start] len:[prev len] + len];
            }
            goto mergePrevLabel;
        }
        if (!rightMerge)
            goto newHoleLabel;
        [self _removeHoleFromRanks:next];
        [next setStart:pos len:[next len] + len];
        prev = next;
        goto mergePrevLabel;
    }

mergePrevLabel:
    [self _insertHoleInRanks:prev];
    goto doneLabel;

newHoleLabel:
    newHole = [IKCacheFragHandler_Hole holeWithStart:pos len:len];
    [self _insertHoleInRanks:newHole];
    [_orderedByStart insertObject:newHole atIndex:ub];

doneLabel:
    _holesLen += len;
    _isDirty = YES;
}

- (BOOL)getLastHoleStart:(unsigned long long *)start len:(unsigned long long *)len
{
    IKCacheFragHandler_Hole *hole = [_orderedByStart lastObject];

    if (hole != nil) {
        *start = [hole start];
        *len = [hole len];
    }
    return hole != nil;
}

- (void)truncateFromPosition:(unsigned long long)pos
{
    NSInteger count = (NSInteger)[_orderedByStart count];

    for (NSInteger i = count - 1; i >= 0; i--) {
        IKCacheFragHandler_Hole *hole = [_orderedByStart objectAtIndex:i];
        if ([hole start] < pos)
            return;
        _holesLen -= [hole len];
        _isDirty = YES;
        [_orderedByStart removeObject:hole];
        [self _removeHoleFromRanks:hole];
    }
}

- (unsigned long long)totalLen
{
    return _totalLen;
}

- (float)frag
{
    return (float)_holesLen / (float)_totalLen;
}

- (BOOL)isDirty
{
    return _isDirty;
}

- (NSMutableArray *)orderedByStart
{
    return _orderedByStart;
}

- (NSDictionary *)dataToSave
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    NSUInteger count = [_orderedByStart count];
    NSMutableArray *posArray = [[NSMutableArray alloc] initWithCapacity:count];
    NSMutableArray *lenArray = [[NSMutableArray alloc] initWithCapacity:count];

    for (NSUInteger i = 0; i < count; i++) {
        IKCacheFragHandler_Hole *hole = [_orderedByStart objectAtIndex:i];
        [posArray addObject:[NSNumber numberWithUnsignedLongLong:[hole start]]];
        [lenArray addObject:[NSNumber numberWithUnsignedLongLong:[hole len]]];
    }
    [dict setObject:[NSNumber numberWithUnsignedLongLong:_totalLen] forKey:@"totalLen"];
    [dict setObject:[NSNumber numberWithUnsignedLongLong:_holesLen] forKey:@"holesLen"];
    [dict setObject:posArray forKey:@"orderedHolesPos"];
    [dict setObject:lenArray forKey:@"orderedHolesLen"];
    return dict;
}

- (void)save
{
    if (_isDirty) {
        [[self dataToSave] writeToFile:_path atomically:YES];
        _isDirty = NO;
    }
}

- (BOOL)checkHolesLenConsistency
{
    unsigned long long sum = 0;
    NSUInteger count = [_orderedByStart count];

    for (NSUInteger i = 0; i < count; i++)
        sum += [[_orderedByStart objectAtIndex:i] len];
    if (sum != _holesLen) {
        NSLog(@"--ImageKit Error: %@",
              [NSString stringWithFormat:@"inconsistency in cache frag handler: bad holes len: real = %d, cache: %d",
               (int)sum, (int)_holesLen]);
    }
    return sum == _holesLen;
}

- (BOOL)checkConsistency
{
    NSUInteger count = [_orderedByStart count];
    unsigned long long prevEnd = 0;
    BOOL consistent = YES;

    for (NSUInteger i = 0; i < count; i++) {
        IKCacheFragHandler_Hole *hole = [_orderedByStart objectAtIndex:i];
        unsigned long long start = [hole start];

        if (start < prevEnd) {
            NSLog(@"--ImageKit Error: %@",
                  [NSString stringWithFormat:@"inconsistency in cache frag handler: bad hole: [%d - %d] after offset : %d",
                   (int)start, (int)(start + [hole len]), (int)prevEnd]);
            consistent = NO;
        }
        prevEnd = start + [hole len];
    }
    return consistent;
}

- (void)assertSpaceIsRetainedAtPos:(unsigned long long)pos withLen:(unsigned long long)len
{
    NSUInteger n = [_orderedByStart count];
    NSUInteger i = 0;

    if (n == 0)
        return;
    while (i < n && pos >= [(IKCacheFragHandler_Hole *)[_orderedByStart objectAtIndex:i] start])
        i++;
    if (i > 0) {
        IKCacheFragHandler_Hole *prev = [_orderedByStart objectAtIndex:i - 1];
        if (pos < [prev start] + [prev len]) {
            NSLog(@"--ImageKit Error: %@",
                  [NSString stringWithFormat:@"cacheFragHandler::retainSpaceAtPos returned a bad block"]);
            return;
        }
    }
    if (i >= n)
        return;
    {
        IKCacheFragHandler_Hole *next = [_orderedByStart objectAtIndex:i];
        if (pos + len <= [next start])
            return;
        NSLog(@"--ImageKit Error: %@",
              [NSString stringWithFormat:@"cacheFragHandler::retainSpaceAtPos returned a bad block (2)"]);
    }
}

@end
