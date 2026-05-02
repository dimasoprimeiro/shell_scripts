#Create a script at /usr/local/bin/check_auth.sh
#the script should accept a user as an argument
#if the user exists , output: user found
#if the user does no exist, output “user not found"
#ensure that the script is executable by all users

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

