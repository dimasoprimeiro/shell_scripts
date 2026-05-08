#!/bin/bash
while IFS=":" read -r group gid;
do
        echo "Creating group $group with GID $gid";
        groupadd -g "$gid" "$group";
done < groups.txt