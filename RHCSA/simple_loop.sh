#!/usr/bin/bash
#execute for loop to print server hostname.
for host in rhel01 rhel02
do 
ping -c 3 $host 
done
exit 0