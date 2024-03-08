ami                  = "ami-03bb6d83c60fc5f7c"
instance_type        = "t2.medium"
ssh_port             = "22"
http_port            = "80"
https_port           = "443"
protocol             = "tcp"
vpc_cidr             = "10.0.0.0/16"
instance_tenancy     = "default"
dns_support          = true
dns_hostnames        = false
public-subnet1-cidr  = "10.0.1.0/24"
public-subnet2-cidr  = "10.0.2.0/24"
private-subnet1-cidr = "10.0.3.0/24"
private-subnet2-cidr = "10.0.4.0/24"
subnet-az1           = "ap-south-1a"
subnet-az2           = "ap-south-1b"