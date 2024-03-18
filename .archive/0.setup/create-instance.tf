# create-instance.tf
 
resource "aws_instance" "instance" {
count = var.numberofinstances

  ami                         = var.instance_ami
  availability_zone           = "${var.aws_region}${var.aws_region_az}"
  instance_type               = var.instance_type
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg.id]
  subnet_id                   = aws_subnet.subnet.id
  key_name                    = var.key_pair
  private_ip                  = "${lookup(var.ips,count.index)}"
  user_data                   = <<EOF
#!/bin/bash
echo ubuntu:'${var.userpass}'|sudo chpasswd
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo hostnamectl set-hostname "${var.owner}-${count.index}"
sudo apt update && sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common net-tools wget curl
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs)  stable"
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update && sudo apt-get -y install docker-ce docker-compose kubectl
sudo systemctl enable docker
sudo usermod -aG docker ubuntu
sudo mkdir /home/ubuntu/.kube
sudo chmod 777 /home/ubuntu/.kube
wget https://github.com/coder/code-server/releases/download/v4.4.0/code-server_4.4.0_amd64.deb
sudo dpkg -i code-server_4.4.0_amd64.deb
sudo systemctl enable --now code-server@ubuntu
mkdir /home/ubuntu/.config
mkdir /home/ubuntu/.config/code-server
echo "bind-addr: 0.0.0.0:8080" > /home/ubuntu/.config/code-server/config.yaml
echo "auth: password" >> /home/ubuntu/.config/code-server/config.yaml
echo "password: VMware1!" >> /home/ubuntu/.config/code-server/config.yaml
echo "cert: false" >> /home/ubuntu/.config/code-server/config.yaml
sudo apt upgrade -y
sudo docker pull registry.tanzu.dk/dockerhub/library/nginx:latest
sudo docker pull registry.tanzu.dk/dockerhub/library/mysql:5.7
sudo docker pull registry.tanzu.dk/dockerhub/library/wordpress:latest
sudo reboot
EOF
 
  root_block_device {
    delete_on_termination = true
    encrypted             = false
    volume_size           = var.root_device_size
    volume_type           = var.root_device_type
  }
 
  tags = {
    "Owner"               = var.owner
    "Name"                = "${var.owner}-${count.index}"
    "KeepInstanceRunning" = "false"
  }
}

resource "aws_instance" "k8s" {
  ami                         = var.instance_ami
  availability_zone           = "${var.aws_region}${var.aws_region_az}"
  instance_type               = var.k8s_instance_type
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg.id]
  subnet_id                   = aws_subnet.subnet.id
  key_name                    = var.key_pair
  private_ip                  = "10.0.1.9"
  user_data                   = <<EOF
#!/bin/bash
echo ubuntu:'${var.userpass}'|sudo chpasswd
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo hostnamectl set-hostname "k8s"
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update && sudo apt-get -y install kubectl net-tools
sudo snap install microk8s --classic
sudo usermod -aG microk8s ubuntu
sudo mkdir /home/ubuntu/.kube
sudo microk8s config > /home/ubuntu/.kube/config
sudo ufw disable
sudo apt upgrade -y
sudo reboot
EOF
 
  root_block_device {
    delete_on_termination = true
    encrypted             = false
    volume_size           = var.root_device_size
    volume_type           = var.root_device_type
  }
 
  tags = {
    "Owner"               = var.owner
    "Name"                = "k8s"
    "KeepInstanceRunning" = "false"
  }
}