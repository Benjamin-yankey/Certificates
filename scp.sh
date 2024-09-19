#!/bin/bash

# Prompt the user for input
read -p "Enter the public IP address of the EC2 instance: " instance_ip
read -p "Enter the path to your SSH key pair file (e.g., keypair.pem): " key_file
read -p "Enter the username (default is 'ubuntu'): " username

# Set default username to 'ubuntu' if not provided
if [ -z "$username" ]; then
    username="ubuntu"
fi

# Prompt for the direction of the transfer: upload or download
read -p "Do you want to upload or download a file? (enter 'upload' or 'download'): " direction

# Check for valid input
if [[ "$direction" != "upload" && "$direction" != "download" ]]; then
    echo "Invalid choice. Please enter 'upload' or 'download'."
    exit 1
fi

# Prompt for the local file path
read -p "Enter the local file path (e.g., ~/myfolder/myfile.txt): " local_file_path

# Prompt for the remote file path
read -p "Enter the remote file path (e.g., /home/ubuntu/): " remote_file_path

# Ensure the key file has the correct permissions
chmod 400 "$key_file"

# Perform file upload or download based on the user's choice
if [ "$direction" == "upload" ]; then


    # Upload file from local machine to EC2 instance
    echo "Uploading $local_file_path to $username@$instance_ip:$remote_file_path..."

    scp -i "$key_file" "$local_file_path" "$username@$instance_ip:$remote_file_path"
elif [ "$direction" == "download" ]; then




    # Download file from EC2 instance to local machine
    echo "Downloading $remote_file_path to $local_file_path..."
    scp -i "$key_file" "$username@$instance_ip:$remote_file_path" "$local_file_path"
fi
