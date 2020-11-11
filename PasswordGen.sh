#!/bin/bash

#Simple Password Generator 

echo "Hi Welcome to Password Generator"

echo -e "Enter Branch Number\n0 for CE \n1 for CSE \n2 for EE \n3 for ME"
read BRANCH
echo "Please enter the number of students this year: "
read NUM_STUD

YR=$(date +%y)
echo -e "Roll Number \tPassword" >passwords.txt

for ((i = 1 ; i <= ${NUM_STUD} ; i++));
do
	echo -n "1${BRANCH}${YR}01" >>passwords.txt
	
	if [ $i -lt 10 ] 
	then 
		echo -n "00" >>passwords.txt
	elif [ $i -lt 100 ]
       	then
		echo -n "0" >>passwords.txt
	fi
	
	echo -e "${i} \t$(openssl rand -base64 48 | cut -c1-9)" >> passwords.txt

done

echo "Strong passwords are generated and saved into passwords.txt"
