#!/usr/bin/bash
# echo "this is my first bash script"
echo "" >> ~/output.txt
echo "##################################" >> ~/output.txt
echo "list block devices" >> ~/output.txt
echo "" >> ~/output.txt
lsblk >> ~/output.txt
echo "" >> ~/output.txt
echo "##################################" >> ~/output.txt
echo "FILESYSTEM FREE SPACE" >> ~/output.txt
echo "" >> ~/output.txt
df -h >> ~/output.txt
echo "##################################" >> ~/output.txt
