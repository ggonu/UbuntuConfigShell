#!/bin/bash

####################################################
#               Install ROS2 Humble                #
####################################################

# ROS2 Setup before installing
    # Set Locale
    # Check for UTF-8 & Verify settings
locale
sudo apt update && sudo apt install locales -y
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8
locale

    # Setup Sources
sudo apt install software-properties-common
sudo add-apt-repository universe
    # Add ROS2 GPG key with apt.
sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
    # Add the repository to sources list
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

# Install ROS2 packages
sudo apt update && sudo apt upgrade -y
sudo apt install -y ros-humble-desktop-full ros-dev-tools