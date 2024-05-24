#!/bin/bash
echo 'run before_install.sh: '

echo 'sudo yum install python-pip'
sudo yum install python-pip


#!/bin/bash

# Ensure the script exits if a command fails
set -e

# Update the package list
echo "Updating package list..."
sudo yum update -y

# Install Python and pip if they are not already installed
echo "Checking for Python installation..."
if ! command -v python3 &> /dev/null
then
    echo "Python3 not found. Installing Python3..."
    sudo yum install -y python3
else
    echo "Python3 is already installed."
fi

echo "Checking for pip installation..."
if ! command -v pip3 &> /dev/null
then
    echo "pip3 not found. Installing pip3..."
    sudo yum install -y python3-pip
else
    echo "pip3 is already installed."
fi

# Any other system dependencies your application needs
# sudo apt-get install -y <other-dependencies>

# Upgrade pip to the latest version
echo "Upgrading pip..."
sudo -H pip3 install --upgrade pip

echo "Before_install script completed."