#!/bin/bash

# Update package lists
sudo apt update

# List upgradable packages
UPGRADABLE=$(apt list --upgradable | grep -oP '^\S+' | tail -n +2)

# Loop through the upgradable packages and install them one by one
for package in $UPGRADABLE; do
    echo "Upgrading $package..."
    sudo apt install --only-upgrade -y "$package"
done

sudo apt autoremove -y

echo "All packages upgraded."
