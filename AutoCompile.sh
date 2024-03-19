#!/bin/bash

read file_name
echo ""
# I want the file to be passed in as an argument

if [[ $file_name == *.cpp ]]
then
    g++ $file_name -o ${file_name%.cpp}
elif [[ $file_name == *.c ]]
then
    gcc $file_name -o ${file_name%.c}

elif [[ $file_name == *.py ]]
then
    python3 $file_name
elif [[ $file_name == *.rs ]]
then
    rustc $file_name
elif [[ $file_name == *.asm ]]
then
    as $file_name -o ${file_name%.asm}.o
    gcc ${file_name%.asm}.o -o ${file_name%.asm} -nostdlib -static
    rm ${file_name%.asm}.o

elif [[ $file_name == *.js ]]
then
  node $file_name
elif [[ $file_name == *.ts ]]
then
  tsc $file_name
else
    echo "File type not supported"
fi
