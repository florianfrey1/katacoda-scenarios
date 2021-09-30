#!/bin/bash

stty flusho
stty -echo
clear

until [ -f ./init.js ]
do
    sleep 1
done

node init.js

stty -flusho
stty echo