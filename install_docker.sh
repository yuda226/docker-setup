#!/bin/bash
# This script helps install docker for you

sudo apt-get remove docker docker-engine docker.io containerd runc

sudo apt-get update

sudo apt-get install \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg-agent \
  software-properties-common

# Trust software provided by docker organization
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

# Add docker organization as a source of software (for update)
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

# Update system
sudo apt-get update

# Install docker
sudo apt-get install docker-ce docker-ce-cli containerd.io

# Create the docker group
sudo groupadd docker

# Add your user to the docker group
sudo usermod -aG docker $USER

# Log out and log back in so that your group membership is re-evaluated.
# If testing on a virtual machine, it may be necessary to restart the virtual machine for changes to take effect.
# On a desktop Linux environment such as X Windows, log out of your session completely and then log back in.
# On Linux, you can also run the following command to activate the changes to groups:
newgrp docker