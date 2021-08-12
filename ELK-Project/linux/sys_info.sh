#!/bin/bash

if [ $UID != 0 ]
then
echo "You must run this sctipt using SUDO!"
exit
fi

#Variables
output=$HOME/scripts/sys_info.txt
IP=$(ip addr | grep inet |tail -2 |head -1)
exes=$(find /home -type f -perm 777)

if [ ! -d $HOME/research ]
then
mkdir $Home/research
fi

if [ -f $HOME/research/sys_info.txt ]
then
rm sys_info.txt
fi

if [ -f $output ]
then
rm $output
fi

echo -e "Group B $(date)\n" >> $output

echo -e "This is the info for the machine $(uname)\n" >> $output

echo -e "This is the machine type $MACHTYPE\n" >> $output

echo -e "This is the IP address for the machine $(ip addr | head -n 9 | tail -n 1)\n" >> $output

echo -e "This is the hostname for the machine $HOSTNAME\n" >> $output

#Bonus
echo -e "This is the DNS info $(cat /etc/resolv.conf)\n" >> $output

echo -e "THis is the MEM info $(free -m)\n" >> $output

echo -e "CPU info $(lscpu)\n" >> $output

echo -e "Disk Usage $(df -h)\n" >> $output

echo -e "Logged on users $(who)\n" >> $output

echo -e "Executable files: $exes\n" >> $output
#Bonus 2
echo -e "find 777 file $(find / -type f  -perm 777)\n" >> $output
echo -e " Top 10 processes $(ps aux -m | awk {'print $1, $2, $3, $4, $11'} | head)" >> $output

sp=('/etc/shadow' '/etc/passwd')
for perm in ${sp[@]}
do
ls -l $perm >> $output
done
