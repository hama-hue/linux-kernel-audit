
#!/bin/bash

echo "Analyzing Failed Login Attempts:"
echo "--------------------------------"

sudo grep "Failed password" /var/log/auth.log | tail -n 10
