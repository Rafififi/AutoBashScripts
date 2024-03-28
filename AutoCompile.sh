#!/bin/bash

file_name=$1

if [[ -z "$file_name" ]]; then
    echo "Usage: $0 <file_name>"
    exit 1
fi

extension="${file_name##*.}"

case "$extension" in
    "cpp")
        g++ "$file_name" -o "${file_name%.cpp}"
        ;;
    "c")
        gcc "$file_name" -o "${file_name%.c}"
        ;;
    "py")
        python3 "$file_name"
        ;;
    "rs")
        rustc "$file_name"
        ;;
    "asm")
        as "$file_name" -o "${file_name%.asm}.o"
        gcc "${file_name%.asm}.o" -o "${file_name%.asm}" -nostdlib -static
        rm "${file_name%.asm}.o"
        ;;
    "js")
        node "$file_name"
        ;;
    "ts")
        tsc "$file_name"
        ;;
    *)
        echo "File type not supported"
        ;;
esac
