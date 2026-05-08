#!/bin/bash
while IFS=":" read -r user uid groups; 
do
    echo "Creating user $user with UID $uid in belonging to groups $groups";
    useradd -G $groups -u $uid $user;
done < users.txt