#!/bin/bash
#====================================================================
# Account Management Script
# Description: Simple script to create user accounts with basic options
# Author: System Administrator
# Version: 1.0
#====================================================================

# Display script header
echo "========================================"
echo "     USER ACCOUNT CREATION SCRIPT      "
echo "========================================"
echo

#--------------------------------------------------------------------
# STEP 1: Get username from user
#--------------------------------------------------------------------
echo "Please provide a username?"
read u
echo

#--------------------------------------------------------------------
# STEP 2: Check if username already exists
#--------------------------------------------------------------------
grep -q $u /etc/passwd
if [ $? -eq 0 ]
then
    echo "ERROR -- User $u already exist"
    echo "Please choose another username"
    echo
    exit 0
fi

#--------------------------------------------------------------------
# STEP 3: Get user description
#--------------------------------------------------------------------
echo "Please provide user description?"
echo "(Example: Sales Manager, IT Support, etc.)"
read d
echo

#--------------------------------------------------------------------
# STEP 4: Ask for custom UID
#--------------------------------------------------------------------
echo "Do you want to specify user ID (y/n)?"
read ynu
echo

if [ $ynu == y ]
then
    #----------------------------------------------------------------
    # STEP 4a: Get and verify custom UID
    #----------------------------------------------------------------
    echo "Please enter UID (1000-60000 recommended):"
    read uid
    
    # Check if UID already exists
    grep -q $uid /etc/passwd
    if [ $? -eq 0 ]
    then
        echo "ERROR -- UserID $uid already exist"
        echo "Please use different UID"
        echo
        exit 0
    else
        # Create account with custom UID
        useradd $u -c "$d" -u $uid
        echo "SUCCESS -- User account created with custom UID"
        echo
        echo "Username: $u"
        echo "Description: $d"
        echo "UID: $uid"
        echo
    fi
    
elif [ $ynu == n ]
then
    #----------------------------------------------------------------
    # STEP 4b: Create account with auto-generated UID
    #----------------------------------------------------------------
    echo "No worries, system will assign a UID automatically"
    useradd $u -c "$d"
    echo "SUCCESS -- User account created"
    echo
    echo "Username: $u"
    echo "Description: $d"
    echo "UID: Auto-assigned by system"
    echo
else
    #----------------------------------------------------------------
    # STEP 4c: Handle invalid input
    #----------------------------------------------------------------
    echo "ERROR -- Invalid input. Please enter y or n"
    echo "Exiting script..."
    exit 0
fi

#--------------------------------------------------------------------
# STEP 5: Display final account information
#--------------------------------------------------------------------
echo "========================================"
echo "     ACCOUNT CREATION COMPLETE         "
echo "========================================"
echo "To verify, run: tail -1 /etc/passwd"
echo "========================================"