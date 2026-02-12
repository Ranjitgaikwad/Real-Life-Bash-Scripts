#!/bin/bash
# Script: logged_users.sh
# Description: Display users who logged in on a specific date
# Usage: ./logged_users.sh

echo "========================================"
echo "     USER LOGIN HISTORY LOOKUP"
echo "========================================"
echo

# Get input from user
echo "Please enter day (e.g., Mon):"
read d

echo "Please enter month (e.g., Aug):"
read m

echo "Please enter date (e.g., 28):"
read da

echo
echo "Users logged in on $d $m $da:"
echo "----------------------------------------"

# Search and display login records for specified date
last | grep "$d $m $da"

echo "----------------------------------------"
echo "Search completed"


#=========================================================================================================
: 'Note

User Login History Script
A simple bash script to check which users logged in on a specific date.

Features
Takes day, month, and date as input from user

Displays login records for the specified date

Uses standard Linux last command

Usage
chmod +x logged_users.sh
./logged_users.sh

Example
text
Please enter day (e.g., Mon): Mon
Please enter month (e.g., Aug): Aug
Please enter date (e.g., 28): 28

Users logged in on Mon Aug 28:
user1   pts/0        192.168.1.5      Mon Aug 28 09:15
user2   pts/1        192.168.1.10     Mon Aug 28 10:30
 
 Note'