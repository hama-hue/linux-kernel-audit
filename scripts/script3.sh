#!/bin/bash
# Script 3: Disk and Permission Auditor

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "Directory Audit Report"
echo "----------------------"

for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        echo "$DIR => Permissions: $PERMS | Size: $SIZE"
    else
        echo "$DIR does not exist on this system"
    fi
done

echo ""
echo "Linux Kernel Config Check"
echo "-------------------------"

# Kernel config file location (common in Linux systems)
CONFIG="/boot/config-$(uname -r)"

if [ -f "$CONFIG" ]; then
    PERMS=$(ls -l "$CONFIG" | awk '{print $1, $3, $4}')
    echo "Kernel config found!"
    echo "$CONFIG => Permissions: $PERMS"
else
    echo "Kernel config file not found in /boot (common in WSL)"
fi