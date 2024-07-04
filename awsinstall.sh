#!/bin/bash

# Update package lists and install necessary packages
sudo apt update
sudo apt install curl unzip -y

# Download AWS CLI v2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Unzip the downloaded package
unzip awscliv2.zip

# Install AWS CLI v2
sudo ./aws/install

# Check if AWS CLI is installed successfully
if [ $? -eq 0 ]; then
    # AWS CLI installation successful
    echo "AWS CLI installed successfully"
    aws --version | grep "aws-cli"
    if [ $? -eq 0 ]; then
        # AWS CLI version found
        zenity --info --title="Success" --text="AWS CLI is installed successfully"
    else
        # AWS CLI version not found
        zenity --error --title="Error" --text="AWS CLI installation failed"
    fi
else
    # AWS CLI installation failed
    echo "AWS CLI installation failed"
    zenity --error --title="Error" --text="AWS CLI installation failed"
fi
