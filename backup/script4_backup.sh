#!/bin/bash

echo "Creating backup directory..."

mkdir -p backup

echo "Backing up shell scripts..."
cp *.sh backup/

echo "Backup completed!"
