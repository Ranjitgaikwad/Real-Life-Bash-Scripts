#!/bin/bash
# =============================================
# FILESYSTEM BACKUP SCRIPT
# =============================================
# Description: This script creates a compressed backup
#              of /etc and /var directories, checks if
#              backup was created successfully, and
#              transfers it to remote server
# =============================================

# Step 1: Create tar backup of important directories
echo "Creating backup archive..."
tar cvf /tmp/backup.tar /etc /var

# Step 2: Compress the backup to save space
echo "Compressing backup..."
gzip /tmp/backup.tar

# Step 3: Check if backup file was modified in last 24 hours
find /tmp/backup.tar.gz -mtime -1 -type f &> /dev/null

# Step 4: Check command status and proceed accordingly
if [ $? -eq 0 ]
then
    echo " Backup was created successfully"
    echo "----------------------------------------"
    echo " Archiving backup to remote server..."
    echo ""
    
    # Transfer backup to remote server
    # Note: Replace 192.168.1.x with actual IP and /path with destination
    scp /tmp/backup.tar.gz root@192.168.1.x:/path
    
    echo " Backup transfer completed"
else
    echo " Backup failed - File not found or older than 1 day"
    exit 1
fi

# Step 5: Display backup details
echo ""
echo " Backup file location: /tmp/backup.tar.gz"
echo " Backup size: $(du -h /tmp/backup.tar.gz | cut -f1)"
echo " Backup date: $(date)"
echo "============================================"

#=========================================================================================================
: 'Note

Change 192.168.1.x to your actual server IP

Change /path to your actual backup destination

Make sure SSH key authentication is set up for password-less transfer
 
 Note'