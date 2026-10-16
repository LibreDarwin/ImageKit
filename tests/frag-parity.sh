#!/bin/sh
# Copyright (C) 2026, LibreDarwin
# SPDX-License-Identifier: BSD-3-Clause
#
# Differential parity harness for IKCacheFragHandler (+ _Hole).
#
# ImageKit is a private framework that exports no symbols, so the fixture
# binds to neither implementation at link time: it dlopen()s the framework
# named on the command line and reaches the classes through the ObjC
# runtime.  This harness therefore builds frag-parity once and runs the
# same binary twice -- against Apple's host framework and against the one
# built from src/ -- then diffs the two transcripts record by record.
#
# Both runs must reach a *different* image, which is checked below, or a
# pass would just be the framework compared against itself.

set -eu

here=$(dirname "$0")
top=$(cd "$here/.." && pwd)
CONFIG=${CONFIG:-release}
FW=$top/build/$CONFIG/ImageKit.framework

SDK=${SDK:-/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk}
CC=${CC:-/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang}
ORACLE=/System/Library/Frameworks/Quartz.framework/Versions/A/Frameworks/ImageKit.framework/Versions/A/ImageKit
OURS=$FW/Versions/A/ImageKit

[ -d "$FW" ] || { echo "missing $FW -- run make first" >&2; exit 1; }
# Apple's ImageKit has no on-disk file: it lives in the dyld shared cache,
# but the absolute path is still what dlopen resolves, so do not test -f.

out=${TMPDIR:-/tmp}/ik-frag-parity.$$
mkdir -p "$out"

case $CONFIG in
    asan) SAN="-fsanitize=address,undefined -fno-sanitize-recover=all" ;;
    *)    SAN="" ;;
esac

echo "building fixture"
# shellcheck disable=SC2086
$CC -O1 -fobjc-arc -mmacosx-version-min=26.5 \
    -isysroot "$SDK" -Wall -Wextra $SAN -I "$top/src" \
    -o "$out/frag-parity" "$here/frag-parity.m" \
    -framework Foundation

[ "$ORACLE" != "$OURS" ] || { echo "oracle and ours are the same file" >&2; exit 1; }

"$out/frag-parity" "$ORACLE" > "$out/oracle.txt"
"$out/frag-parity" "$OURS"   > "$out/ours.txt"

total=$(wc -l < "$out/oracle.txt" | tr -d ' ')
MAXREPORT=${MAXREPORT:-60}

if python3 - "$out/oracle.txt" "$out/ours.txt" "$MAXREPORT" <<'PY'
import sys

def load(path):
    recs = {}
    order = []
    with open(path) as f:
        for line in f:
            parts = line.split()
            if not parts:
                continue
            recs.setdefault(parts[0], []).append(' '.join(parts[1:]))
            order.append(parts[0])
    return recs, order

a, order = load(sys.argv[1])
b, border = load(sys.argv[2])
maxreport = int(sys.argv[3]) or len(order)

bad = 0
seen = set()
for label in order:
    if label in seen:
        continue
    seen.add(label)
    av = a.get(label, [])
    bv = b.get(label, [])
    if av == bv:
        continue
    bad += 1
    if bad <= maxreport:
        print('MISMATCH %s' % label)
        for i in range(max(len(av), len(bv))):
            x = av[i] if i < len(av) else '<missing>'
            y = bv[i] if i < len(bv) else '<missing>'
            if x != y:
                print('   [%d] apple %s' % (i, x))
                print('        ours  %s' % y)

only_a = [l for l in order if l not in b]
only_b = [l for l in border if l not in a]
for l in only_a[:10]:
    print('ONLY-IN-APPLE %s' % l); bad += 1
for l in only_b[:10]:
    print('ONLY-IN-OURS %s' % l); bad += 1

print()
print('%d distinct cases, %d mismatched' % (len(seen), bad))
sys.exit(1 if bad else 0)
PY
then
    echo "PARITY OK ($total lines compared)"
    exit 0
else
    echo "PARITY FAILED"
    exit 1
fi
