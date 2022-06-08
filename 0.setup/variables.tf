# variables.tf
 
# Variables for general information
######################################
 
variable "userpass" {
  description = "Ubuntu user Password"
  type        = string
  default     = "VMware1!"
}
variable "numberofinstances" {
  description = "Number of Students (Max 25)"
  type        = number
}
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}
 
variable "owner" {
  description = "Configuration owner"
  type        = string
  default     = "student"
}
 
variable "aws_region_az" {
  description = "AWS region availability zone"
  type        = string
  default     = "a"
}
 
 
# Variables for VPC
######################################
 
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}
 
variable "vpc_dns_support" {
  description = "Enable DNS support in the VPC"
  type        = bool
  default     = true
}
 
variable "vpc_dns_hostnames" {
  description = "Enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}
 
 
# Variables for Security Group
######################################
 
variable "sg_ingress_proto" {
  description = "Protocol used for the ingress rule"
  type        = string
  default     = "tcp"
}
 
variable "sg_ingress_ssh" {
  description = "Port used for the ingress rule"
  type        = string
  default     = "22"
}
 
variable "sg_egress_proto" {
  description = "Protocol used for the egress rule"
  type        = string
  default     = "-1"
}
 
variable "sg_egress_all" {
  description = "Port used for the egress rule"
  type        = string
  default     = "0"
}
 
variable "sg_egress_cidr_block" {
  description = "CIDR block for the egress rule"
  type        = string
  default     = "0.0.0.0/0"
}
 
 
# Variables for Subnet
######################################
 
variable "sbn_public_ip" {
  description = "Assign public IP to the instance launched into the subnet"
  type        = bool
  default     = true
}
 
variable "sbn_cidr_block" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "ips" {
    default = {
        "0" = "10.0.1.10"
        "1" = "10.0.1.11"
        "2" = "10.0.1.12"
        "3" = "10.0.1.13"
        "4" = "10.0.1.14"
        "5" = "10.0.1.15"
        "6" = "10.0.1.16"
        "7" = "10.0.1.17"
        "8" = "10.0.1.18"
        "9" = "10.0.1.19"
        "10" = "10.0.1.20"
        "11" = "10.0.1.21"
        "12" = "10.0.1.22"
        "13" = "10.0.1.23"
        "14" = "10.0.1.24"
        "15" = "10.0.1.25"
        "16" = "10.0.1.26"
        "17" = "10.0.1.27"
        "18" = "10.0.1.28"
        "19" = "10.0.1.29"
        "20" = "10.0.1.30"
        "21" = "10.0.1.31"
        "22" = "10.0.1.32"
        "23" = "10.0.1.33"
        "24" = "10.0.1.34"
        "25" = "10.0.1.35"
    }
}
 
# Variables for Route Table
######################################
 
variable "rt_cidr_block" {
  description = "CIDR block for the route table"
  type        = string
  default     = "0.0.0.0/0"
}
 
 
# Variables for Instance
######################################
 
variable "instance_ami" {
  description = "ID of the AMI used"
  type        = string
  default     = "ami-015c25ad8763b2f11"
}
 
variable "instance_type" {
  description = "Type of the instance"
  type        = string
  default     = "t2.medium"
}

variable "k8s_instance_type" {
  description = "Type of the instance"
  type        = string
  default     = "t2.xlarge"
}
 
variable "key_pair" {
  description = "SSH Key pair used to connect"
  type        = string
  default     = "jensenr"
}
 
variable "root_device_type" {
  description = "Type of the root block device"
  type        = string
  default     = "gp2"
}
 
variable "root_device_size" {
  description = "Size of the root block device"
  type        = string
  default     = "50"
}