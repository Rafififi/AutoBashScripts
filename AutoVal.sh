#!/bin/bash

file_name=$1

if [[ -z "$file_name" ]]; then
    echo "Usage: $0 <file_name>"
    exit 1
fi

extension="${file_name##*.}"

case "$extension" in
    "cpp" | "c" | "rs" | "asm")
        valgrind --leak-check=full --show-reachable=yes --show-leak-kinds=all --track-origins=yes --verbose --log-file=valgrind-out.txt "./$file_name"
        ;;
    *)
        echo "File type not supported"
        ;;
esac
