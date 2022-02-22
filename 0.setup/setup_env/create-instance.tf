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
#!/bin/bash -xe
echo "Update system"
sudo apt update
sudo apt upgrade -y

echo "Set hostname"
sudo hostnamectl set-hostname "${var.owner}-${count.index}"

echo "Install docker"
sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs)  stable"

sudo apt update

sudo apt-get -y install docker-ce docker-compose

sudo systemctl start docker

sudo systemctl enable docker

sudo systemctl status docker

echo "Add user to docker group"
sudo usermod -aG docker ubuntu

echo "Reboot system"
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