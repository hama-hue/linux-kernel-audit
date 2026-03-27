
echo "System Identity Information"
echo "---------------------------"
echo "Hostname:"
hostname

echo ""
echo "Current User:"
whoami

echo ""
echo "Kernel Version:"
uname -r

echo ""
echo "Operating System:"
grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"'

echo ""
echo "System Architecture:"
uname -m

