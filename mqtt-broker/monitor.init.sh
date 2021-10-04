#!/bin/bash

# Print the status to the console.
function print_status {
    clear
    echo "Umgebung wird vorbereitet..."
    echo "   Assets laden $1"
    echo "   HiveMQ-CE Docker Container starten $2"
    echo "   Project initialisieren $3"
}

function wait_for {
    until [ -f $1 ] &> /dev/null
    do
        sleep 1 &> /dev/null
    done

    rm -r $1 &> /dev/null
}

# Suppress all input and outputs to and from the console.
# Hide the cursor.
stty flusho
stty -echo
tput civis

print_status ⏳ ⏳ ⏳
wait_for ./assets.ready
print_status ✅ ⏳ ⏳
wait_for ./hivemq.ready
print_status ✅ ✅ ⏳
wait_for ./project.ready
print_status ✅ ✅ ✅

# Reset all console settings.
stty echo
stty -flusho
tput cnorm
clear