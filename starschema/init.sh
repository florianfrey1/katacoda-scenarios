#!/bin/bash

stty flusho
stty -echo

./setup.sh

stty -flusho

clear
echo "Die Umgebung ist jetzt bereit!"
echo " - Die Postgres-Datenbank ist bereit"
echo " - Das NodeJS-Projekt ist angelegt"

stty echo