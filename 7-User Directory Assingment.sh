#!/bin/bash
# Script: check_home_dirs.sh
# Description: Check if directories in /home are assigned to a valid user
# Version: 1.0

# Change to /home directory
cd /home || {
    echo "ERROR: Cannot access /home directory"
    exit 1
}

# Loop through all directories in /home
for DIR in *
do
    # Skip if not a directory
    [ -d "$DIR" ] || continue
    
    # Check if directory name exists in /etc/passwd
    CHK=$(grep -c "^$DIR:" /etc/passwd)
    
    if [ "$CHK" -ge 1 ]
    then
        echo "$DIR is assigned to a user"
    else
        echo "$DIR is NOT assigned to a user"
    fi
done

#=========================================================================================================
: 'Note

Steps to use:

Create the file:
vi check_home_dirs.sh
Copy and paste the script above

Make it executable:
chmod +x check_home_dirs.sh

Run as root:
./check_home_dirs.sh
 
 Note'