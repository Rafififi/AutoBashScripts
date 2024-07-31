#!/bin/bash

read file_name

echo ""
# I want the file to be passed in as an argument

if [[ $file_name == *.cpp ]]
then
  g++ $file_name -o ${file_name%.cpp}
elif [[ $file_name == *.c ]]
then
  include_genericLinkedList=$(grep -q '#include "genericLinkedList"' $file_name; echo $?)
  include_math=$(grep -q '#include <math.h>' $file_name; echo $?)
  if [[ $include_genericLinkedList == 1 ]]
  then
    gcc $file_name -lgenericLinkedList -o ${file_name%.c}
  elif [[ $include_math == 1 ]]
  then
    gcc $file_name -lm -o ${file_name%.c}
  else
    gcc $file_name -o ${file_name%.c}
  fi
elif [[ $file_name == *.py ]]
then
  python3 $file_name
elif [[ $file_name == *.rs ]]
then
  cargo build
elif [[ $file_name == *.asm ]]
then
  as $file_name -o ${file_name%.asm}.o
  gcc ${file_name%.asm}.o -o ${file_name%.asm} -nostdlib -static
  rm ${file_name%.asm}.o

elif [[ $file_name == *.js ]]
then
  node $file_name
elif [[ $file_name == *.html ]]
then
  open $file_name
elif [[ $file_name == *.ts ]]
then
  tsc $file_name
elif [[ $file_name == *.hs ]]
then
  ghc $file_name
  rm ${file_name%.hs}.o
  rm ${file_name%.hs}.hi
else
  echo "File type not supported"
fi
