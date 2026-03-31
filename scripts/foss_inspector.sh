#!/bin/bash
# Script 2: FOSS Package Inspector (WSL Compatible)

PACKAGE="linux-kernel"

# Check kernel using uname instead of dpkg
KERNEL_VERSION=$(uname -r)

if [ -n "$KERNEL_VERSION" ]; then
    echo "Linux Kernel is installed."
    echo "Version: $KERNEL_VERSION"
    uname -a
else
    echo "Linux Kernel is NOT detected."
fi

# Case statement for philosophy note
case $PACKAGE in
    linux-kernel)
        echo "Linux Kernel: the core of open-source operating systems powering the world"
        ;;
    apache2)
        echo "Apache: the web server that built the open internet"
        ;;
    mysql-server)
        echo "MySQL: open source at the heart of millions of applications"
        ;;
    python3)
        echo "Python: simple yet powerful language driving modern development"
        ;;
    *)
        echo "Unknown package: part of the open-source ecosystem"
        ;;
esac