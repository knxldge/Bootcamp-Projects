#!/bin/bash


#Variable Lists
num=$(echo {0..9})
=$(ls)

# States Activity - Top 5 States
states=(
	'Nebraska'
	'Hawaii'
	'New York'
	'California'
	'Las Vegas'
)

for states in ${states[@]};
do
	if [ $states = 'Hawaii' ]
	then
	  echo $states "is the best!"
else
	echo "i'm not fond of Hawaii"
fi
done


# List of Number Activity
for num in ${num[@]};
do
	if [ $num = 3 ] || [ $num =  5 ] || [ $num = 7 ]
	then
	  echo $num
else
	  echo "Thats not my number!"
fi
done

# ETC Paths for shadow and passwd - Show Permission via ls -l
files=('/etc/shadow' '/etc/passwd')
output=('~/')
for files in ${files[@]};
do
	ls -l $files >> $output
done

#sudo acceser to users
for user in $(ls /home)

