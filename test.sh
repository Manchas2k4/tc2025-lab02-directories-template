#!/bin/bash

# HOW TO RECREATE THE TEST FILES
#./app apt dir1 > temp.txt
#sed -i '/^$/d;s/[[:blank:]]//g' temp.txt
#sed -i 's/\r//g' temp.txt
#sort temp.txt > non_recursive.txt
#./app apt dir1 -r > temp.txt
#sed -i '/^$/d;s/[[:blank:]]//g' temp.txt
#sed -i 's/\r//g' temp.txt
#sort temp.txt > recursive.txt

rm temp.txt run.txt app

sed -i 's/\r//g' $1
sed -i 's/\r//g' non_recursive.txt
sed -i 's/\r//g' recursive.txt

cal=0
echo "Compiling..."
gcc $1 -o app > /dev/null 2>&1
if [[ $? -ne 0 ]] ; then
	echo "grade: $cal"
	exit 1
fi
echo " done."
cal=$((cal+10))

echo "Checking parameters..."
./app > /dev/null 2>&1
if [[ $? -ne 255 ]] ; then
	echo "grade: $cal"
	exit 1
fi
echo " done."
cal=$((cal+10))


echo "Verifying that the directory exists..."
./app apt not_exist > /dev/null 2>&1
if [[ $? -ne 254 ]] ; then
	echo "grade: $cal"
	exit 1
fi
echo " done."
cal=$((cal+5))

echo "Checking if it's a directory..."
./app apt test.sh > /dev/null 2>&1
if [[ $? -ne 254 ]] ; then
	echo "grade: $cal"
	exit 1
fi
echo " done."
cal=$((cal+5))

echo "Verifying that the recursion parameter is valid (-r)..."
./app apt dir1 -x > /dev/null 2>&1
if [[ $? -ne 253 ]] ; then
	echo "grade: $cal"
	exit 1
fi
echo " done."
cal=$((cal+10))

echo "Running non-recursive..."
./app apt dir1 > temp.txt
if [[ $? -ne 0 ]] ; then
	echo "grade: $cal"
	exit 1
fi
sed -i '/^$/d;s/[[:blank:]]//g' temp.txt
sed -i 's/\r//g' temp.txt
sort temp.txt > run.txt

diff run.txt non_recursive.txt > /dev/null 2>&1
if [[ $? -ne 0 ]] ; then
	echo "grade: $cal"
	exit 1
fi
echo " done."
cal=$((cal+30))

echo "Running recursive..."
./app apt dir1 -r > temp.txt
if [[ $? -ne 0 ]] ; then
	echo "grade: $cal"
	exit 1
fi
sed -i '/^$/d;s/[[:blank:]]//g' temp.txt
sed -i 's/\r//g' temp.txt
sort temp.txt > run.txt

diff run.txt recursive.txt > /dev/null 2>&1
if [[ $? -ne 0 ]] ; then
	echo "grade: $cal"
	exit 1
fi
echo " done."
cal=$((cal+30))

echo "=>grade: $cal"
