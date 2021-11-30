#!/bin/bash
echo -e "This is your machine \n"
echo -e "Date: "$(date)" \n"
echo -e "Machine Type:"
echo $MACHTYPE
echo -e "Uname Info: $(iname -a) \n)"
echo -e "IP Info:$(ip addr | grep inet | tail -3 | head -1) \n"
echo -e "Hostmame: $(hostname -s)"
echo -e "DNS Servers:"
cat /etc/resolv.conf
echo "Memory Info:"
free
echo -e "\n CPU Infor:"
lscpu | grep CPU
echo -r "\n Disk Usage"
df -H | head -2
echo -e "\n Who is logged in: \n $(who) \n"
echo "I am Dead"
echo -e "PS: Akiyo will curse your dreams!"
