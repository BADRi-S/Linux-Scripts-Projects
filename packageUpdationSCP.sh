#!/bin/bash
echo "Initialization of the installation"
#--------------------------------------------------------------------
#-------------------HOW TO RUN THE SCRIPT----------------------------
#IF THE SCRIPT NEEDS TO BE ADDED TO THE CRONTAB
#->Make the script executable:
#chmod +x /path/to/post_install.sh
# 
#->Open your user's crontab:
#crontab -e
#
#->Add this line at the end:
# @reboot /path/to/post_install.sh
# This script will run automatically run every time the system boots.
# ---------------------------------------------------------------------
#IF THE SCRIPT IS ADDED TOI THE CRONJOB FOR CLEARING THE PACKAGES
#sudo apt autoremove -y
#sudo apt autoclean -y
#For Updating the system files
sudo apt update && sudo apt upgrade -y #replace package name to desired by replacing 'apt'
#Basic Utilities
echo"Installing essential utilities"
sudo apt install -y \
	curl \
	wget \
	git \
	unzip \
	htop \
	tree \
	net-tools \
	build-essentials \
	software-properties-common \
	apt-transport-https \
	ca-certificates\
	gnupg \
	lsb-release
#Below is the short description of what each package does
"
curl: Tool to make network requests (like downloading files or APIs via HTTP/S).

wget: Another command-line downloader â€” great for grabbing files from the internet.

git: Version control system used to clone repositories and manage code.

unzip: Allows you to extract .zip archive files.

htop: useful for monitoring system resource usage.

tree: Displays directory contents in a tree-like format..

net-tools: Includes tools like ifconfig, netstat, etc., for network configuration (useful for diagnostics)."

#Python and pip
sudo apt install -y python3 python3-pip python3-venv #install's Python,pip, python Environment
# Docker
echo "Installing Docker"
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER #adds the current user to Docker group, allows to run the docker commands without sudo.

#Node.js (16.x)
echo "í¿¢ Installing Node.js..."
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt install -y nodejs

# Snap (if not present)
echo "Installing Snap (if not installed)..."
sudo apt install -y snapd

# VS Code
echo "Installing VS Code..."
sudo snap install code --classic

# Nginx
echo "Installing Nginx..."
sudo apt install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx

