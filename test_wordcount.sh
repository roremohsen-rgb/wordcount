#!/usr/bin/env bash
# Simple smoke tests for wordcount.sh
set -euo pipefail

tmpfile=$(mktemp)
printf 'hello world\nsecond line\n' > "$tmpfile"

output=$(bash wordcount.sh "$tmpfile")
expected="2 lines, 4 words, 24 chars"

if [ "$output" != "$expected" ]; then
    echo "FAIL: expected '$expected', got '$output'"
    rm -f "$tmpfile"
    exit 1
fi

echo "PASS: $output"
rm -f "$tmpfile"
