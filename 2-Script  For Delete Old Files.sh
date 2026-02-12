#!/bin/bash

# -----------------------------------------------------------------
# Script: delete_old_files.sh
# Description: Find and delete files older than 90 days
# Author: Your Name
# Date: 2024
# -----------------------------------------------------------------

# Simple script to delete files older than 90 days

DIRECTORY="."    # Directory to search
DAYS=90          # Days threshold

echo "Searching for files older than $DAYS days in $DIRECTORY"

# Show files that will be deleted
echo "Files to be deleted:"
find "$DIRECTORY" -type f -mtime +$DAYS -ls

# Ask for confirmation
read -p "Delete these files? (y/n): " confirm

if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
    find "$DIRECTORY" -type f -mtime +$DAYS -delete
    echo "Files deleted successfully"
else
    echo "Operation cancelled"
fi

#=========================================================================================================
: 'Note

How to use this script:

Save the script:
nano delete_old_files.sh

Make it executable:
chmod +x delete_old_files.sh

Run the script:
./delete_old_files.sh
 
 Note'

