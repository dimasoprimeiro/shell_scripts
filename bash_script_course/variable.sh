#!/bin/bash

# NOT GOOD >>
cp /my/location/from /my/location/to

cp /my/location/from /my/location/to/there

## BETTER

MY_LOCATION_FROM=/my/location/from
MY_LOCATION_TO=/my/location/to

cp $MY_LOCATION_FROM $MY_LOCATION_TO
cp "$MY_LOCATION_FROM/here" "$MY_LOCATION_TO/there"

MY_FIRST_LIST=(one two three four five)
echo $MY_FIRST_LIST
echo ${MY_FIRST_LIST[@]} #imprime a lista toda
echo ${MY_FIRST_LIST[0]} #imprime o primeiro valor