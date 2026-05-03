#!/bin/bash
showname(){
    echo hello "$1"
    if [ "${1,,}" = dimas ]; then 
        return 0
    else
        return 1
    fi
}
showname "$1"

if [ $? = 1 ]; then 
    echo "Alguem fora do conhecimento da vidalokagem chamou essa função"
fi