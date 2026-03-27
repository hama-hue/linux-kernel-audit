#!/bin/bash

echo "Top CPU Consuming Processes:"
echo "-----------------------------"

ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 10
