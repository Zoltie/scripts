#!/bin/bash

cppFiles=$(ls *.cpp)
linking=(-lcurl)
programName=executable

function buildDepList {
for f in $cppFiles
do
echo $f | sed s'/.cpp/.o/g'
done
}

#Final Product
echo $programName.x: $(buildDepList)
echo -e "\tg++ -g -o $programName.x" $(buildDepList) $linking
echo

#List Dependencies
for f in $cppFiles
do
echo -e "$(g++ -MM $f)
\tg++ -g -c $f
"
done

