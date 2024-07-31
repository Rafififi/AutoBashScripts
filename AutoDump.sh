#!/bin/bash

read file_name
# I want the file to be passed in as an argument

echo ""

if [[ $file_name == *.cpp ]]
then
  objdump -S -Mintel ${file_name%.cpp} > ${file_name}.txt
elif [[ $file_name == *.c ]]
then
  objdump -S -Mintel ${file_name%.c} > ${file_name}.txt
elif [[ $file_name == *.rs ]]
then
  objdump -S -Mintel ${file_name%.rs} > ${file_name}.txt
elif [[ $file_name == *.asm ]]
then
  objdump -S -Mintel ${file_name%.asm} > ${file_name}.txt
else
    echo "File type not supported"
fi
