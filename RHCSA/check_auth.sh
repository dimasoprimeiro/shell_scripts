#!/bin/bash
#check if a username is provided
if [ -z "$1" ]; then
    echo "please provide a username"
    exit 1
fi

# check if the user exists in the system
if id "$1" &>/dev/null; then
    echo "User found"
else 
    echo "User not found"
fi

