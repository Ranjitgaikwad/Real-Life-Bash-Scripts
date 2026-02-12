#!/bin/bash

# ------------------------------------------------------------
# DISK SPACE MONITORING SCRIPT
# Simple script to check disk usage and alert if threshold exceeded
# ------------------------------------------------------------

# Set threshold percentage (change this value as needed)
THRESHOLD=80

echo "========================================="
echo "     DISK SPACE USAGE REPORT"
echo "========================================="
echo

# Method 1: Simple df output for all filesystems
echo "Complete disk usage information:"
echo "--------------------------------"
df -h
echo

# Method 2: Show only filesystems above threshold
echo "Filesystems exceeding ${THRESHOLD}% usage:"
echo "------------------------------------------"

# Get disk usage percentages and corresponding filesystems
df -h | grep -vE '^Filesystem|tmpfs|devtmpfs|cdrom' | awk '{print $5, $6}' | while read output
do
    # Extract usage percentage (remove % sign)
    usage=$(echo $output | awk '{print $1}' | cut -d'%' -f1)
    
    # Extract partition name
    partition=$(echo $output | awk '{print $2}')
    
    # Compare with threshold
    if [ $usage -ge $THRESHOLD ]
    then
        echo "WARNING: $partition is at ${usage}% capacity"
        echo "         Action: Consider freeing up space"
    fi
done

echo
echo "========================================="
echo "     DISK CHECK COMPLETED"
echo "========================================="

# Alternative one-liner method (commented out)
# df -h | awk '0+$5 >= 80 {print "Alert: " $6 " at " $5}'


#=========================================================================================================
: 'Note

Save this as disk-check.sh and make it executable:
chmod +x disk-check.sh

How to use:

Save the script to a file

Change the THRESHOLD value (default is 80%)

Run: ./disk-check.sh

What this script does:

Shows complete disk usage information

Filters out unnecessary rows (tmpfs, devtmpfs, cdrom)

Checks each filesystem against your threshold

Displays warnings for filesystems exceeding the limit

Clean, readable output format

To customize:

Change THRESHOLD=80 to any value you want (e.g., 50, 75, 90)

Add or remove filesystem types in the grep -vE line
 Note'