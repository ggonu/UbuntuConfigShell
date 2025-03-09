#!/bin/bash

####################################################
#                  Install Wine                    #
####################################################

# Activate 32bit architecture
sudo dpkg --add-architecture i386

sudo apt install -y wget

# Configure Wine Repository
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key

# Download WindHQ source file
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources\

# Update package
sudo apt-get update

# Install Wine
sudo apt install -y --install-recommends winehq-stable

# For configuration
winecfg

# When winecfg has opened, Enter Library label
# Then select 'd3dx11_43' and add it.