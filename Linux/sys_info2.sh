#!/bin/bash

# If Sudo is running, Exit the script and echo "
if [ $UID = 0 ]
then
    echo "Do not run as SUDO"
        exit
fi

# Define Variables
output = $HOME/research/sys_info.txt
ip =$(ip addr | grep inet | tail -2 | head -1)
execs=$(find /home -type f -perm 777)


#  Checks the existence of ~/research directory
if [ ! -d $HOME/research ]
then
    mkdir $HOME/research
fi 

# Checks the existense of the file ~/research/sys_info.txt
if [ !-f $OUPUT ]
then
rm  $OUTPUT
fi


echo "A Quick System Audit Script" > $OUTPUT
date >> $OUTPUT
echo "" >> $OUTPUT
echo "Machine Type Info:" >> $OUTPUT
echo $MACHTYPE >> $OUTPUT
echo -e "Uname info: $(uname -a) \n" >> $OUTPUT
echo -e "IP Info: $ip \n" >> $OUTPUT
echo -e "Hostname: $(hostname -s) \n" >> $OUTPUT
echo "DNS Servers: " >> $OUTPUT
cat /etc/resolv.conf >> $OUTPUT
echo -e "\nMemory Info:" >> $OUTPUT
free >> $OUTPUT
echo -e "\nCPU Info:" >> $OUTPUT
lscpu | grep CPU >> $OUTPUT
echo -e "\nDisk Usage:" >> $OUTPUT
df -H | head -2 >> 
echo -e "\nWho is logged in: \n $(who -a) \n" >> $OUTPUT
echo -e "\nExec Files:" >> $OUTPUT
$execs >> $OUTPUT
echo -e "\nTop 10 Processes" >> $OUTPUT
ps aux -m | awk {'print $1, $2, $3, $4, $11'} | head >> $OUTPUT

#
#
#
#
#


