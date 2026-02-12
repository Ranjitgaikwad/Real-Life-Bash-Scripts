
#!/bin/bash

# Script: logtail
# Description: Monitors /var/log/messages in real-time and filters error-related lines
# Usage: Run in background with: nohup /root/logtail &

# Continuously follow the end of /var/log/messages
tail -fn0 /var/log/messages | while read line
do
    # Check if line contains common error-related keywords (case insensitive)
    echo "$line" | egrep -i "refused|invalid|error|fail|lost|shut|down|offline"
    
    # If grep was successful (exit code 0), save the line to filtered log
    if [ $? = 0 ]
    then
        echo "$line" >> /tmp/filtered-messages
    fi
done

===============================================================================

#!/bin/bash

# Script: Log-Alert
# Description: Sends email notification if filtered-messages contains errors
# Schedule: Run every 15 minutes via cron job
# Cron: */15 * * * * /root/Log-Alert

# Email recipients (comma separated)
recipients="imran_ny@hotmail.com,charles.gorden@email.com"

# Check if filtered-messages file exists and has content (-s checks if size > 0)
if [ -s /tmp/filtered-messages ]
then
    # Remove duplicate lines, sort alphabetically and email
    cat /tmp/filtered-messages | sort | uniq | mail -s "CHECK: Syslog Errors" "$recipients"
    
    # Clean up - remove processed log file
    rm /tmp/filtered-messages
else
    # No errors found - exit silently
    exit 0
fi


#=========================================================================================================
: 'Note

Setup Instructions
1. Make scripts executable:
chmod +x /root/logtail
chmod +x /root/Log-Alert

2. Start monitoring in background:
nohup /root/logtail &

3. Add to crontab for automatic notifications:
crontab -e

# Add this line:
*/15 * * * * /root/Log-Alert

How it works:
logtail continuously monitors system logs and captures error messages

Captured errors are saved to /tmp/filtered-messages

Every 15 minutes, Log-Alert checks if any errors were captured

If errors exist, sends email with unique error messages

Cleans up the temporary file after sending

Quick Test Commands:

# Check if logtail is running
ps aux | grep logtail

# View filtered messages manually
cat /tmp/filtered-messages

# Test email notification manually
/root/Log-Alert

# Check cron jobs
crontab -l

 Note'