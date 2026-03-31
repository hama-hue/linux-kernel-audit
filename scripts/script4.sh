#!/bin/bash
# Script 4: Log File Analyzer (Linux Kernel)
# Usage: ./log_analyzer.sh /var/log/syslog warning

LOGFILE=$1
KEYWORD=${2:-"error"}    # Default keyword is 'error'
COUNT=0

# Check if file exists
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File $LOGFILE not found."
    exit 1
fi

# Do-while style retry if file is empty
while true; do
    if [ ! -s "$LOGFILE" ]; then
        echo "File is empty. Waiting for logs..."
        sleep 2
    else
        break
    fi
done

# Read file line by line
while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

echo "--------------------------------------"
echo "Linux Kernel Log Analysis Report"
echo "--------------------------------------"
echo "Keyword '$KEYWORD' found $COUNT times in $LOGFILE"

# Print last 5 matching lines
echo ""
echo "Last 5 matching lines:"
grep -i "$KEYWORD" "$LOGFILE" | tail -n 5