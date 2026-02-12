#!/bin/bash
# Script Name: copy_to_hosts.sh
# Description: Simple script to copy a file to multiple remote hosts
# Usage: ./copy_to_hosts.sh

# List of remote hosts
# Add or remove hostnames as needed
for HOST in ubuntu01 fedora02 centos03 rhel06
do
    # Copy file to remote host's /var/tmp/ directory
    # somefile should exist in current directory
    scp somefile $HOST:/var/tmp/
    
    # Check if copy was successful
    if [ $? -eq 0 ]; then
        echo "Successfully copied to $HOST"
    else
        echo "Failed to copy to $HOST"
    fi
done

echo "File copy process completed!"

