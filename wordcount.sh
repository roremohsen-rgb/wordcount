#!/usr/bin/env bash
# A tiny CLI that counts lines, words, and characters in a text file.
set -euo pipefail

if [ "$#" -ne 1 ]; then
    echo "Usage: wordcount.sh <file>" >&2
    exit 1
fi

file="$1"

if [ ! -f "$file" ]; then
    echo "wordcount.sh: file not found: $file" >&2
    exit 1
fi

lines=$(wc -l < "$file")
words=$(wc -w < "$file")
chars=$(wc -m < "$file")

echo "${lines//[[:space:]]/} lines, ${words//[[:space:]]/} words, ${chars//[[:space:]]/} chars"
