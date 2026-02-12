#!/bin/bash
# Status on Total Number of Files
# Purpose: Check if number of files with pattern "file*" is less than 20
# Author: Your Name
# Date: $(date +%Y-%m-%d)

# Count total number of files starting with "file"
file_count=$(ls -l file* 2>/dev/null | wc -l)

# Check if file count is exactly 20
if [ $file_count -eq 20 ]
then
    echo "SUCCESS: Total $file_count files found"
    echo "Status: OK"
else
    echo "ALERT: Total $file_count files found"
    echo "Status: Files are less than 20"
    # Send alert (uncomment and configure as per your requirement)
    # echo "Warning: Only $file_count files present" | mail -s "File Count Alert" your-email@example.com
fi

=====================================================================================================================
#!/bin/bash
#############################################
# Script:  check_file_count.sh
# Purpose: Check if total files are less than 20
# Author:  System Administrator
# Version: 1.0
#############################################

# Define variables
FILE_PATTERN="file*"
ALERT_EMAIL="admin@example.com"  # Change this

# Count files matching the pattern
FILE_COUNT=$(ls -l $FILE_PATTERN 2>/dev/null | wc -l)

# Remove leading/trailing spaces from count
FILE_COUNT=$(echo $FILE_COUNT | tr -d ' ')

# Display current status
echo "==================================="
echo "File Count Status Report"
echo "==================================="
echo "Checking files with pattern: $FILE_PATTERN"
echo "Total files found: $FILE_COUNT"
echo "Required files: 20"
echo "-----------------------------------"

# Compare and take action
if [ $FILE_COUNT -eq 20 ]
then
    echo "✓ Status: NORMAL - All 20 files present"
    exit 0
elif [ $FILE_COUNT -lt 20 ]
then
    echo "⚠ Status: ALERT - Only $FILE_COUNT files found"
    echo "Action: Files are less than 20"
    
    # Optional: Send email alert
    # echo "Alert: Only $FILE_COUNT files present in $(pwd)" | mail -s "File Count Alert" $ALERT_EMAIL
    
    exit 1
else
    echo "ℹ Status: INFO - More than 20 files found ($FILE_COUNT files)"
    exit 0
fi


#=========================================================================================================
: 'Note

# File Count Monitoring Script

A simple bash script to monitor the count of files and send alerts if files are less than 20.

## Script: `check_file_count.sh`

### Description
This script checks the total number of files matching pattern `file*` in the current directory and alerts if count is less than 20.

### Prerequisites
- Linux/Unix environment
- Bash shell
- Execute permission on script

### How to Use

1. **Create test files:**
   ```bash
   touch file{1..20}.txt

Make script executable:
chmod +x check_file_count.sh

Run the script:
./check_file_count.sh

 Note'