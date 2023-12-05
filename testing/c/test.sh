#!/bin/bash

#variable to set the number of tests
numberOfTest=3

#test pass
pass=0 

#colors
YELLOW="\e[33m"
RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"

#compile
#gcc -ansi $1.c -o $1.out

#only c
gcc -ansi -pedantic $1.c -o $1.out -lm



if [ "$3" != "m" ]; then
    for i in $(seq 1 $numberOfTest);
    do
        echo -ne "${YELLOW}[TEST_${i}]${ENDCOLOR}"
        time ./$1.out < ./test/${i}/input.txt >  ./test/${i}/output.txt
        diff_output=$(diff  "./test/${i}/output.txt" "./test/${i}/test.txt")

        echo -n "Wynik: "
        if [ -z "$diff_output" ]; then
            echo  "✔️"
            ((pass++))
        else
            echo  "❌"
           # echo "$diff_output"

        fi
    done

    if [ $pass -lt $numberOfTest ]; then
        echo -e "⚠️  ${RED}${pass}/${numberOfTest}${ENDCOLOR}"
    else
        echo -e "😎  ${GREEN}${pass}/${numberOfTest}${ENDCOLOR}"
    fi
else
./srednia.out < ./test/in.txt > ./test/out.txt
fi