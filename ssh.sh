#!/bin/bash

# Prompt the user for input
read -p "Enter the public IP address of the EC2 instance: " instance_ip
read -p "Enter the path to your SSH key pair file (e.g., keypair.pem): " key_file
read -p "Enter the username (default is 'ubuntu'): " username

# Set default username to 'ubuntu' if not provided
if [ -z "$username" ]; then
    username="ubuntu"
fi

# Check if the key file exists and has the correct permissions
if [ ! -f "$key_file" ]; then
    echo "Error: The key file does not exist at $key_file."
    exit 1
fi

# Ensure the key file has the correct permissions
chmod 400 "$key_file"

# Establish the SSH connection
echo "Connecting to $username@$instance_ip using key file $key_file..."
ssh -i "$key_file" "$username@$instance_ip"
