# Docker

## Install Docker on Ubuntu 20.04 VM

```
sudo apt update

sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs)  stable"

sudo apt update

sudo apt-get -y install docker-ce docker-compose

sudo systemctl start docker

sudo systemctl enable docker

sudo systemctl status docker
```

# Set Docker permissions for user

```
sudo usermod -aG docker ubuntu
```