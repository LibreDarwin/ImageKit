/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 *
 * Differential fixture for IKCacheFragHandler (+ _Hole).
 *
 * ImageKit is a private framework that exports no symbols, so the fixture
 * cannot link against either implementation.  It dlopen()s the framework
 * named on the command line and looks the classes up through the ObjC
 * runtime; the harness runs the very same binary once against Apple's
 * framework and once against the one built from src/.  The header is the
 * only thing shared, and nothing here touches a clock, a pointer value or
 * an address that could differ between runs: the script is a fixed LCG.
 */

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <dlfcn.h>
#import "IKCacheFragHandler.h"
#import "IKCacheFragHandler_Hole.h"

static Class gFragCls;
static Class gHoleCls;

static unsigned long long gRng = 0x0123456789abcdefULL;

static unsigned long long NextRand(void)
{
    gRng = gRng * 6364136223846793005ULL + 1442695040888963407ULL;
    return gRng >> 33;
}

static void Emit(NSString *label, NSString *value)
{
    printf("%s\t%s\n", [label UTF8String], [value UTF8String]);
    fflush(stdout);
}

static NSString *HoleList(IKCacheFragHandler *h)
{
    NSMutableString *s = [NSMutableString string];
    NSArray *a = [h orderedByStart];
    NSUInteger i, n = [a count];

    for (i = 0; i < n; i++) {
        IKCacheFragHandler_Hole *ho = [a objectAtIndex:i];
        if (i)
            [s appendString:@","];
        [s appendFormat:@"%llu:%llu", [ho start], [ho len]];
    }
    return s;
}

static NSString *State(IKCacheFragHandler *h)
{
    unsigned long long ls = 0, lstart = 0;
    BOOL hl = [h getLastHoleStart:&lstart len:&ls];

    return [NSString stringWithFormat:@"total=%llu frag=%.6f dirty=%d n=%lu last=%d/%llu/%llu [%@]",
            [h totalLen], [h frag], [h isDirty] ? 1 : 0,
            (unsigned long)[[h orderedByStart] count], hl ? 1 : 0, lstart, ls, HoleList(h)];
}

static void ScenarioHole(void)
{
    IKCacheFragHandler_Hole *ho = [gHoleCls holeWithStart:12345 len:678];
    NSRange r;

    Emit(@"hole/start", [NSString stringWithFormat:@"%llu", [ho start]]);
    Emit(@"hole/len", [NSString stringWithFormat:@"%llu", [ho len]]);
    r = [ho range];
    Emit(@"hole/range", [NSString stringWithFormat:@"%lu:%lu", (unsigned long)r.location, (unsigned long)r.length]);

    [ho setStart:1 len:2];
    Emit(@"hole/set", [NSString stringWithFormat:@"%llu:%llu", [ho start], [ho len]]);

    [ho setRange:NSMakeRange(0x100000000ULL, 0x200000001ULL)];
    Emit(@"hole/setRange", [NSString stringWithFormat:@"%llu:%llu", [ho start], [ho len]]);
}

static void ScenarioEmpty(void)
{
    IKCacheFragHandler *h = [[gFragCls alloc] init];

    Emit(@"empty/total", [NSString stringWithFormat:@"%llu", [h totalLen]]);
    Emit(@"empty/dirty", [NSString stringWithFormat:@"%d", [h isDirty] ? 1 : 0]);
    Emit(@"empty/holes", HoleList(h));
    Emit(@"empty/canfind0", [h canFindHoleForLen:0] ? @"1" : @"0");
    Emit(@"empty/last", [NSString stringWithFormat:@"%d", [h getLastHoleStart:NULL len:NULL] ? 1 : 0]);
    Emit(@"empty/consistency", [h checkConsistency] ? @"1" : @"0");
    Emit(@"empty/holeslen", [h checkHolesLenConsistency] ? @"1" : @"0");
    Emit(@"empty/find1", [h canFindHoleForLen:1] ? @"1" : @"0");
}

static void ScenarioRandom(void)
{
    IKCacheFragHandler *h = [[gFragCls alloc] init];
    unsigned long long pos[64], len[64];
    int alive[64];
    int n = 0;
    int op;

    for (op = 0; op < 80; op++) {
        unsigned long long r = NextRand();
        if ((r & 1) || n == 0) {
            unsigned long long l = 1 + (NextRand() % 500);
            BOOL added = NO;
            unsigned long long p = [h allocateSpaceForLen:l added:&added];
            if (n < 64) {
                pos[n] = p;
                len[n] = l;
                alive[n] = 1;
                n++;
            }
            Emit([NSString stringWithFormat:@"rand/op%d", op],
                 [NSString stringWithFormat:@"alloc l=%llu p=%llu added=%d %@", l, p, added ? 1 : 0, State(h)]);
        } else {
            int k = (int)(NextRand() % (unsigned long long)n);
            int guard = 0;
            while (!alive[k] && guard < 64) {
                k = (k + 1) % n;
                guard++;
            }
            if (!alive[k])
                continue;
            alive[k] = 0;
            [h releaseSpaceAtPos:pos[k] withLen:len[k]];
            Emit([NSString stringWithFormat:@"rand/op%d", op],
                 [NSString stringWithFormat:@"free p=%llu l=%llu %@", pos[k], len[k], State(h)]);
        }
    }

    Emit(@"rand/consistent", [h checkConsistency] ? @"1" : @"0");
    Emit(@"rand/holeslen", [h checkHolesLenConsistency] ? @"1" : @"0");
    Emit(@"rand/find", [NSString stringWithFormat:@"%d%d%d%d%d",
                        [h canFindHoleForLen:1] ? 1 : 0,
                        [h canFindHoleForLen:499] ? 1 : 0,
                        [h canFindHoleForLen:500] ? 1 : 0,
                        [h canFindHoleForLen:100000] ? 1 : 0,
                        [h canFindHoleForLen:0] ? 1 : 0]);

    {
        NSDictionary *d = [h dataToSave];
        NSArray *kp = [d objectForKey:@"orderedHolesPos"];
        NSArray *kl = [d objectForKey:@"orderedHolesLen"];
        NSMutableString *ps = [NSMutableString string];
        NSMutableString *ls = [NSMutableString string];
        NSUInteger i;

        for (i = 0; i < [kp count]; i++) {
            if (i) {
                [ps appendString:@","];
                [ls appendString:@","];
            }
            [ps appendFormat:@"%llu", [[kp objectAtIndex:i] unsignedLongLongValue]];
            [ls appendFormat:@"%llu", [[kl objectAtIndex:i] unsignedLongLongValue]];
        }
        Emit(@"dict/total", [NSString stringWithFormat:@"%llu", [[d objectForKey:@"totalLen"] unsignedLongLongValue]]);
        Emit(@"dict/holes", [NSString stringWithFormat:@"%llu", [[d objectForKey:@"holesLen"] unsignedLongLongValue]]);
        Emit(@"dict/pos", ps);
        Emit(@"dict/len", ls);

        IKCacheFragHandler *h2 = [[gFragCls alloc] initWithDictionary:d];
        Emit(@"dict/reload", State(h2));
        Emit(@"dict/reload/same", [State(h2) isEqualToString:State(h)] ? @"1" : @"0");
    }
}

static void ScenarioTruncate(void)
{
    IKCacheFragHandler *h = [[gFragCls alloc] init];
    BOOL added = NO;
    unsigned long long p0 = [h allocateSpaceForLen:100 added:&added];
    unsigned long long p1 = [h allocateSpaceForLen:100 added:&added];
    unsigned long long p2 = [h allocateSpaceForLen:100 added:&added];
    unsigned long long p3 = [h allocateSpaceForLen:100 added:&added];

    (void)p0;
    [h releaseSpaceAtPos:p1 withLen:100];
    [h releaseSpaceAtPos:p2 withLen:100];
    [h releaseSpaceAtPos:p3 withLen:100];
    Emit(@"trunc/before", State(h));
    [h truncateFromPosition:p1 + 50];
    Emit(@"trunc/mid", State(h));
    [h truncateFromPosition:p0];
    Emit(@"trunc/all", State(h));
    Emit(@"trunc/after", [NSString stringWithFormat:@"total=%llu n=%lu",
                          [h totalLen], (unsigned long)[[h orderedByStart] count]]);
}

static void ScenarioFile(void)
{
    NSString *path = [NSTemporaryDirectory() stringByAppendingPathComponent:@"ik-frag-parity.plist"];
    IKCacheFragHandler *h;
    BOOL added = NO;

    [[NSFileManager defaultManager] removeItemAtPath:path error:NULL];

    h = [[gFragCls alloc] initWithFilePath:path];
    Emit(@"file/fresh", [NSString stringWithFormat:@"dirty=%d %@", [h isDirty] ? 1 : 0, State(h)]);

    [h allocateSpaceForLen:400 added:&added];
    [h allocateSpaceForLen:100 added:&added];
    [h releaseSpaceAtPos:0 withLen:300];
    Emit(@"file/pre-save", State(h));
    [h save];
    Emit(@"file/post-save/dirty", [h isDirty] ? @"1" : @"0");

    {
        IKCacheFragHandler *h3 = [[gFragCls alloc] initWithFilePath:path];
        Emit(@"file/reload", State(h3));
        Emit(@"file/reload/same", [State(h3) isEqualToString:State(h)] ? @"1" : @"0");
    }
}

static void ScenarioMerge(void)
{
    IKCacheFragHandler *h = [[gFragCls alloc] init];
    BOOL added = NO;
    unsigned long long a0 = [h allocateSpaceForLen:100 added:&added];
    unsigned long long a1 = [h allocateSpaceForLen:200 added:&added];
    unsigned long long a2 = [h allocateSpaceForLen:300 added:&added];

    [h releaseSpaceAtPos:a1 withLen:200];
    Emit(@"merge/afterMiddle", State(h));
    [h releaseSpaceAtPos:a0 withLen:100];
    Emit(@"merge/afterLeft", State(h));
    [h releaseSpaceAtPos:a2 withLen:300];
    Emit(@"merge/afterRight", State(h));
    Emit(@"merge/final", State(h));
}

int main(int argc, char **argv)
{
    @autoreleasepool {
        if (argc < 2) {
            fprintf(stderr, "usage: %s <path-to-ImageKit>\n", argv[0]);
            return 2;
        }
        if (dlopen(argv[1], RTLD_NOW) == NULL) {
            fprintf(stderr, "dlopen: %s\n", dlerror());
            return 2;
        }
        gFragCls = objc_getClass("IKCacheFragHandler");
        gHoleCls = objc_getClass("IKCacheFragHandler_Hole");
        if (gFragCls == Nil || gHoleCls == Nil) {
            fprintf(stderr, "classes not found after dlopen\n");
            return 2;
        }

        ScenarioHole();
        ScenarioEmpty();
        ScenarioRandom();
        ScenarioTruncate();
        ScenarioFile();
        ScenarioMerge();
    }
    return 0;
}
