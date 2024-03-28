#!/bin/bash

read file_name
# I want the file to be passed in as an argument

echo ""

if [[ $file_name == *.cpp ]]
then
  ./${file_name%.cpp}
elif [[ $file_name == *.c ]]
then
  ./${file_name%.c}
elif [[ $file_name == *.rs ]]
then
  ./${file_name%.rs}
elif [[ $file_name == *.asm ]]
then
  ./${file_name%.asm}
elif [[ $file_name == *.py ]]
then
    python3 $file_name
elif [[ $file_name == *.js ]]
then
  node $file_name
elif [[ $file_name == *.ts ]]
then
  node ${file_name%.ts}.js
else
  echo "File type not supported"
fi
