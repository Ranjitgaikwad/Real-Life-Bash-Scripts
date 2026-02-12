#!/bin/bash

# ============================================
# FILE SYSTEM FOR LOOPS - BASIC SCRIPTS
# ============================================

# --------------------------------------------
# 1 - Simple counting from 1 to 25
# --------------------------------------------
echo "=== Script 1: Simple Counting ==="
for i in {1..25}
do
    sleep 1
    echo $i
done

echo "Press Enter to continue..."
read
clear

# --------------------------------------------
# 2 - Create 10 files with names imran.1 to imran.10
# --------------------------------------------
echo "=== Script 2: Create Multiple Files ==="
for i in {1..10}
do
    touch imran.$i
    echo "Created file: imran.$i"
done

echo "10 files created successfully"
echo "Press Enter to continue..."
read
clear

# --------------------------------------------
# 3 - Create files based on user input
# --------------------------------------------
echo "=== Script 3: Create Files Based on User Input ==="
echo "How many files do you want to create?"
read total_files

echo "What should be the base name of files?"
read base_name

# Create files using user input
for i in $(seq 1 $total_files)
do
    touch $base_name.$i
    echo "Created file: $base_name.$i"
done

echo "$total_files files created with base name: $base_name"
echo "Press Enter to continue..."
read
clear

# --------------------------------------------
# 4 - Add write permissions to all imran files
# --------------------------------------------
echo "=== Script 4: Add Write Permissions ==="
# Check if imran files exist
file_count=$(ls imran* 2>/dev/null | wc -l)

if [ $file_count -eq 0 ]
then
    echo "No imran files found. Creating sample files first..."
    for i in {1..5}
    do
        touch imran.$i
        echo "Created imran.$i"
    done
fi

# Assign write permissions to all imran files
for i in imran*
do
    echo "Assigning write permissions to $i"
    chmod a+w $i
    sleep 1
done

echo "Write permissions assigned to all imran files"
echo "Press Enter to continue..."
read
clear

# --------------------------------------------
# 5 - Add write permissions with time calculation
# --------------------------------------------
echo "=== Script 5: Add Write Permissions with Time Display ==="
# Count total imran files
total_files=$(ls imran* 2>/dev/null | wc -l)

if [ $total_files -eq 0 ]
then
    echo "No imran files found. Exiting..."
    exit 1
fi

echo "Total files to process: $total_files"
echo "It will take approximately $total_files seconds to complete"
echo "----------------------------------------"

counter=1
for i in imran*
do
    echo "[$counter/$total_files] Assigning write permissions to $i"
    chmod a+w $i
    sleep 1
    counter=$((counter + 1))
done

echo "----------------------------------------"
echo "Task completed! $total_files files processed"
echo ""

# --------------------------------------------
# 6 - BONUS: Delete created files (optional)
# --------------------------------------------
echo "=== Bonus Script: Clean Up ==="
echo "Do you want to delete all imran files? (yes/no)"
read answer

if [ "$answer" = "yes" ]
then
    rm -f imran.*
    echo "All imran files deleted"
else
    echo "Files kept in current directory"
fi

echo ""
echo "All scripts executed successfully!"

#=========================================================================================================
: 'Note

How to Use:
Save this script as file_operations.sh

Make it executable: chmod +x file_operations.sh

Run it: ./file_operations.sh
 
 Note'