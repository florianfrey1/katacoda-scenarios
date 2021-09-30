#!/bin/bash

stty flusho
stty -echo
clear
echo "Die Umgebung wird vorbereitet..."

./setup.sh &> /dev/null

stty -flusho

clear
echo "Die Umgebung ist bereit!"
echo " - Die Postgres-Datenbank ist bereit"
echo " - Das NodeJS-Projekt ist angelegt"

stty echo