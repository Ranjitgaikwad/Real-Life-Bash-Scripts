#!/bin/bash

# =============================================
# Script: check-remote-server-connectivity.sh
# Description: Check remote server connectivity using ping
# Author: Your Name
# Date: $(date +%Y-%m-%d)
# =============================================

# ---------- Single Server Check ----------
# Define variables for easy modification
HOST="192.168.1.235"

echo "Checking connectivity to $HOST..."

# Ping the server once, suppress all output
ping -c1 $HOST &> /dev/null

# Check the exit status of ping command
# 0 = success, non-zero = failure
if [ $? -eq 0 ]
then
    echo "✓ $HOST is reachable (OK)"
else
    echo "✗ $HOST is not reachable (NOT OK)"
fi

echo ""  # Add blank line for better readability

# ---------- Multiple Servers Check ----------
# Uncomment below section to check multiple servers from a file

<< 'MULTI_SERVER'
#!/bin/bash

# Create a text file with IP addresses (one per line)
# Example ip_list.txt:
# 192.168.1.1
# 192.168.1.235
# 8.8.8.8

IPLIST="ip_list.txt"

# Check if IP list file exists
if [ ! -f "$IPLIST" ]; then
    echo "Error: $IPLIST file not found!"
    exit 1
fi

echo "Checking connectivity for multiple servers..."
echo "----------------------------------------"

# Read IP addresses from file and ping each one
for ip in $(cat $IPLIST)
do
    ping -c1 $ip &> /dev/null
    
    if [ $? -eq 0 ]
    then
        echo " $ip - Ping Successful"
    else
        echo " $ip - Ping Failed"
    fi
done

echo "----------------------------------------"
MULTI_SERVER

# ---------- Usage Instructions ----------
: << 'USAGE'
How to use this script:
------------------------
1. Single server: 
   - Modify HOST variable with desired IP address
   - Run: ./check-remote-server-connectivity.sh

2. Multiple servers:
   - Uncomment the MULTI_SERVER section above
   - Create ip_list.txt file with IP addresses
   - Run: ./check-remote-server-connectivity.sh

3. Make script executable:
   chmod +x check-remote-server-connectivity.sh

4. To suppress all output (silent mode):
   ./check-remote-server-connectivity.sh &> /dev/null
USAGE

# Exit successfully
exit 0

#=========================================================================================================
: 'Note

To use this script:

Save it as check-remote-server-connectivity.sh

Make it executable: chmod +x check-remote-server-connectivity.sh

Run it: ./check-remote-server-connectivity.sh

For IP list file method:

Create servers.txt in same directory

Add one IP per line:

text
192.168.1.1
192.168.1.235
8.8.8.8
Uncomment the IPLIST line in script and comment the SERVERS line
 
 Note'

