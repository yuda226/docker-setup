# Docker - Setup

This is a guide to setting up docker container on your Ubunt. This setup is for Ubuntu 16.04, however, I believe it will be very similar for other Ubuntu systems.

## Step 1

**Uninstall old versions**

```bash
# Remove old version of docker
sudo apt-get remove docker docker-engine docker.io containerd runc
```

## Step 2

**Set up the repository**

```bash
# Update system
sudo apt-get update

# Setup your repository and install some dependencies
sudo apt-get install \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg-agent \
  software-properties-common
```

**Add Docker’s official GPG key:**

```bash
# Trust software provided by docker organization
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

# Add docker organization as a source of software (for update)
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
```

**ERROR**

```bash
W: The repository 'https://download.docker.com/linux/debian xenial Release' does not have a Release file.
N: Data from such a repository can't be authenticated and is therefore potentially dangerous to use.
N: See apt-secure(8) manpage for repository creation and user configuration details.
E: Failed to fetch https://download.docker.com/linux/debian/dists/xenial/stable/binary-amd64/Packages  404  Not Found
E: Some index files failed to download. They have been ignored, or old ones used instead.
```

If you faced the above problems (cannot add the docker organization as a source of software), please use the following command.

```bash
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
xenial \
stable"
```

## Step 3

**Install Docker Engine**

```bash
# Update system
sudo apt-get update

# Install docker
sudo apt-get install docker-ce docker-ce-cli containerd.io
```

## Step 4

**Add my user to use docker container without sudo**

```bash
# Create the docker group
sudo groupadd docker

# Add your user to the docker group
sudo usermod -aG docker $USER

# Log out and log back in so that your group membership is re-evaluated.
# If testing on a virtual machine, it may be necessary to restart the virtual machine for changes to take effect.
# On a desktop Linux environment such as X Windows, log out of your session completely and then log back in.
# On Linux, you can also run the following command to activate the changes to groups:
newgrp docker

# Verify that you can run docker commands without sudo
docker run hello-world
```

## Search for Help on How to Use docker command

```bash
man docker-run
```

## Reference

- Installation guide [link](https://docs.docker.com/engine/install/debian/)
- Post installation guide (for using docker without sudo) [link](https://docs.docker.com/engine/install/linux-postinstall/)
- Issue with adding repository into Ubuntu [link](https://stackoverflow.com/questions/41133455/docker-repository-does-not-have-a-release-file-on-running-apt-get-update-on-ubun)