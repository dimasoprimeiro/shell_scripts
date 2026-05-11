#!/bin/bash

if [[ -n $1 ]]; then
        name=$1
else
        read -rp 'Enter your name: ' name
fi
echo "hello $name"