#!/bin/bash

read file_name
# I want the file to be passed in as an argument

echo ""

if [[ $file_name == *.cpp ]]
then
  valgrind --leak-check=full --show-reachable=yes --show-leak-kinds=all --track-origins=yes --verbose --log-file=valgrind-out.txt ./${file_name%.cpp}
elif [[ $file_name == *.c ]]
then
  valgrind --leak-check=full --show-reachable=yes --show-leak-kinds=all --track-origins=yes --verbose --log-file=valgrind-out.txt ./${file_name%.c}

elif [[ $file_name == *.rs ]]
then
  valgrind --leak-check=full --show-reachable=yes --show-leak-kinds=all --track-origins=yes --verbose --log-file=valgrind-out.txt ./${file_name%.rs}
elif [[ $file_name == *.asm ]]
then
  valgrind --leak-check=full --show-reachable=yes --show-leak-kinds=all --track-origins=yes --verbose --log-file=valgrind-out.txt ./${file_name%.asm}
fi
