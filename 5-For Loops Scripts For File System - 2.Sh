

#!/bin/bash
# Purpose: Rename all .txt files to have .none extension
# Author: Your Name
# Date: $(date +%Y-%m-%d)

# Loop through all .txt files in current directory
for filename in *.txt
do
    # Check if any .txt files exist
    if [ -f "$filename" ]; then
        # Remove .txt extension and add .none extension
        mv "$filename" "${filename%.txt}.none"
        echo "Renamed: $filename -> ${filename%.txt}.none"
    else
        echo "No .txt files found in current directory"
        break
    fi
done

#=========================================================================================================
: 'Note

This script finds all files ending with .txt in the current directory

It renames each file by removing .txt and adding .none extension

Example: document.txt becomes document.none

Includes error checking to verify files exist before renaming
 
 Note'

================================================================================

#!/bin/bash
# Purpose: Check if important system files exist
# Author: Your Name
# Date: $(date +%Y-%m-%d)

# List of files to check
FILES="/etc/passwd
/etc/group
/etc/shadow
/etc/nsswitch.conf
/etc/ssh/sshd_config
/etc/fake"

echo "=== File Existence Check ==="
echo "Checking system files..."
echo

# Loop through each file in the list
for file in $FILES
do
    # Check if file exists
    if [ ! -e "$file" ]; then
        echo "MISSING: $file - does not exist"
    else
        echo "FOUND: $file - exists"
    fi
done

echo
echo "=== Check Complete ==="


#=========================================================================================================
: 'Note

This script verifies if critical system configuration files exist

It checks common files like passwd, group, shadow, ssh config

Provides clear output showing which files are present or missing

Fixed the sshd_config path from incorrect /etc/sshd_ssh_config to correct /etc/ssh/sshd_config
 
  Note'

====================================================================================

#!/bin/bash
# Purpose: Count number of files by extension in current directory
# Author: Your Name
# Date: $(date +%Y-%m-%d)

echo "=== File Count by Extension ==="
echo

# Get unique extensions and count them
for ext in txt pdf sh conf log none
do
    count=$(ls -1 *.$ext 2>/dev/null | wc -l)
    if [ $count -gt 0 ]; then
        echo "Files with .$ext extension: $count"
    fi
done

echo
echo "=== Count Complete ==="


#=========================================================================================================
: 'Note

Demonstrates another practical use of for loops with files

Counts how many files have specific extensions

Suppresses error messages when no files match

Clean and simple output format

# How to Use These Scripts:

Save the script to a file (e.g., rename_files.sh)

Make it executable: chmod +x rename_files.sh

Run the script: ./rename_files.sh
 
 Note'