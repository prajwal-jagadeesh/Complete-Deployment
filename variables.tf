variable "ami" {
  description = "AMI of EC2"
}

variable "instance_type" {
  description = "intance type of EC2"
}

variable "ssh_port" {
  description = "ssh port for EC2 SG"
}

variable "http_port" {
  description = "http_port for EC2 SG"
}

variable "https_port" {
  description = "https_port for EC2 SG"
}

variable "protocol" {
  description = "protocol for security inbound rules"
}

variable "vpc_cidr" {
  description = "vpc_cidr"
}

variable "instance_tenancy" {
  description = "instance_tenancy"
}

variable "dns_support" {
  description = "dns_support"
}

variable "dns_hostnames" {
  description = "dns_hostnames"
}

variable "subnet-az1" {
  description = "subnet-az1"
}

variable "subnet-az2" {
  description = "subnet-az2"
}

variable "public-subnet1-cidr" {
  description = "public-subnet1-cidr"
}

variable "public-subnet2-cidr" {
  description = "public-subnet2-cidr"
}

variable "private-subnet1-cidr" {
  description = "private-subnet1-cidr"
}

variable "private-subnet2-cidr" {
  description = "private-subnet2-cidr"
}