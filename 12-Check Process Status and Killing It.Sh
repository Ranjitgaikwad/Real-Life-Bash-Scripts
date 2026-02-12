#!/bin/bash

# Script: kill_sleep_process.sh
# Description: Find and kill all 'sleep 600' processes
# Author: Your Name

# Find all processes running "sleep 600"
# grep -v grep : Exclude the grep command itself from the output
# awk '{print $2}' : Extract the process ID (PID) which is in second column
# xargs kill : Kill each process using its PID

ps -ef | grep "sleep 600" | grep -v grep | awk '{print $2}' | xargs -I{} kill {}

# Check if any process was killed
if [ $? -eq 0 ]; then
    echo "All 'sleep 600' processes have been killed successfully."
else
    echo "No 'sleep 600' processes found or error in killing."
fi

#=========================================================================================================
: 'Note

How to use:

Save either version to a file (e.g., kill_sleep.sh)

Make it executable: chmod +x kill_sleep.sh

Run it: ./kill_sleep.sh
 Note'