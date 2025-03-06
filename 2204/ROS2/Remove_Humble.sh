#!/bin/bash

######################################################
#               Uninstall ROS2 Humble                #
######################################################

sudo apt remove ~nros-humble-* && sudo apt autoremove

    # Remove the repository
sudo rm /etc/apt/sources.list.d/ros2.list
sudo apt update
sudo apt autoremove
    # Consider upgrading for packages previously shadowed.
sudo apt upgrade