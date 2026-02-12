#!/bin/bash
# Script Name: disable_inactive_users.sh
# Description: Disables user accounts that have been inactive for 90+ days
# Usage: sudo ./disable_inactive_users.sh

# Check if script is running with root privileges
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root"
    echo "Usage: sudo $0"
    exit 1
fi

echo "=== Inactive User Account Disabler ==="
echo "Finding users inactive for 90+ days..."
echo "----------------------------------------"

# Get list of users who haven't logged in for 90+ days
# lastlog -b 90: shows users inactive for 90+ days
# tail -n+2: removes header line
# grep -v 'Never logged in': excludes users who never logged in
# awk '{print $1}': extracts username
INACTIVE_USERS=$(lastlog -b 90 | tail -n+2 | grep -v 'Never logged in' | awk '{print $1}')

# Check if any inactive users found
if [[ -z "$INACTIVE_USERS" ]]; then
    echo "No inactive users found."
    exit 0
fi

# Display inactive users found
echo "The following users have been inactive for 90+ days:"
echo "$INACTIVE_USERS"
echo "----------------------------------------"

# Ask for confirmation before disabling
read -p "Do you want to disable these accounts? (y/n): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Operation cancelled."
    exit 0
fi

# Disable accounts using for loop
echo "Disabling inactive accounts..."
for username in $INACTIVE_USERS
do
    echo "Disabling account: $username"
    usermod -L $username  # Locks the user account
    
    # Check if command was successful
    if [[ $? -eq 0 ]]; then
        echo "  -> Successfully disabled $username"
    else
        echo "  -> Failed to disable $username" >&2
    fi
done

echo "----------------------------------------"
echo "Process completed."
echo "Disabled accounts can be re-enabled with: usermod -U username"


#=========================================================================================================
: 'Note

Save this as disable_inactive_users.sh and make it executable:
chmod +x disable_inactive_users.sh

Run with:
sudo ./disable_inactive_users.sh

What this script does:

Checks if running with root privileges

Finds users inactive for 90+ days (excluding never logged in)

Shows you the list of users found

Asks for confirmation before disabling

Disables each account and shows progress

Provides helpful feedback messages
 Note'