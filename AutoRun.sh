#!/bin/bash

file_name=$1

if [[ -z "$file_name" ]]; then
    echo "Usage: $0 <file_name>"
    exit 1
fi

extension="${file_name##*.}"

case "$extension" in
    "cpp" | "c" | "rs" | "asm" | "py" | "js")
        ./"$file_name"
        ;;
    "ts")
        node "${file_name%.ts}.js"
        ;;
    *)
        echo "File type not supported"
        ;;
esac
