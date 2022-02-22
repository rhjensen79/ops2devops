# Docker

## Pre req (Already done)

During deployment, the following have been done to the VM's to make sure they can run docker.

```
echo "Update system"
sudo apt update
sudo apt upgrade -y

echo "Set hostname to match student id"
sudo hostnamectl set-hostname "${var.owner}-${count.index}"

echo "Add docker repo software repository"
sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs)  stable"

echo "Install Docker"
sudo apt update
sudo apt-get -y install docker-ce docker-compose

echo "Set docker services to autostart"
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker

echo "Add current user to docker group"
sudo usermod -aG docker ubuntu

echo "Reboot system"
sudo reboot
```

