#!/bin/sh
#
# Copyright (C) 2026, LibreDarwin
# SPDX-License-Identifier: BSD-3-Clause
#
# Behavior-parity gate for IKSegmentedRawDataBuffer and
# IKMultipleSegmentedRawDataBuffer. Builds the fixture once, runs it against
# Apple's ImageKit and against our build, and diffs the transcripts. Apple's
# ImageKit has no on-disk file (it lives in the dyld shared cache) so the
# absolute path is only checked to exist logically, not with test -f.
#

set -eu
here=$(cd "$(dirname "$0")" && pwd)
top=$(cd "$here/.." && pwd)
CONFIG=${CONFIG:-release}
FW=$top/build/$CONFIG/ImageKit.framework/Versions/A/ImageKit
OURS=$FW
ORACLE=/System/Library/Frameworks/Quartz.framework/Versions/A/Frameworks/ImageKit.framework/Versions/A/ImageKit
CLANG=$(xcrun -f clang)
SDK=$(xcrun --show-sdk-path)
OUT=${TMPDIR:-/tmp}/ik-segrawbuffer-parity
mkdir -p "$OUT"

echo "building fixture"
"$CLANG" -fobjc-arc -O1 -Wall -mmacosx-version-min=26.5 -isysroot "$SDK" \
    -o "$OUT/fixture" "$here/segrawbuffer-parity.m" -framework Foundation

[ -x "$OURS" ] || { echo "missing our framework at $OURS (run make)" >&2; exit 1; }

"$OUT/fixture" "$ORACLE" >"$OUT/oracle.txt" 2>"$OUT/oracle.err"
"$OUT/fixture" "$OURS"   >"$OUT/ours.txt"   2>"$OUT/ours.err"

if diff -u "$OUT/oracle.txt" "$OUT/ours.txt" >"$OUT/diff.txt"; then
    total=$(wc -l <"$OUT/oracle.txt" | tr -d ' ')
    echo "PARITY OK ($total lines compared)"
    exit 0
else
    echo "PARITY FAILED -- see $OUT/diff.txt"
    sed -n '1,80p' "$OUT/diff.txt"
    exit 1
fi
