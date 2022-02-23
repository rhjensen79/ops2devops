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
  user_data                   = <<EOF
#!/bin/bash
echo ubuntu:'${var.userpass}'|sudo chpasswd
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo hostnamectl set-hostname "${var.owner}-${count.index}"
sudo apt update && sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs)  stable"
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update && sudo apt-get -y install docker-ce docker-compose kubectl
sudo systemctl enable docker
sudo usermod -aG docker ubuntu
sudo mkdir /home/ubuntu/.kube
sudo chmod 777 /home/ubuntu/.kube
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
  user_data                   = <<EOF
#!/bin/bash
echo ubuntu:'${var.userpass}'|sudo chpasswd
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo hostnamectl set-hostname "k8s"
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update && sudo apt-get -y install kubectl
sudo snap install microk8s --classic
sudo usermod -aG microk8s ubuntu
sudo mkdir /home/ubuntu/.kube
sudo microk8s config > /home/ubuntu/.kube/config
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