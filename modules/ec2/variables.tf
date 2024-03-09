variable "ami" {
  description = "AMI"
}

variable "EC2_ssh_port" {
  description = "The port the EC2 Instance should listen on for SSH requests."
  type        = number
  default     = 22
}

variable "ssh_user" {
  description = "SSH user name to use for remote exec connections,"
  type        = string
  default     = "ubuntu"
}

variable "instance_type" {
  description = "intance type"
}

variable "instance_names" {
  type = list(string)
  default = [
    "jenkins_vm",
    "sonarqube_vm",
    "nexus_vm",
    "jenkins_slave_vm"
  ]
}


variable "ssh_port" {
  description = "The SSH port to allow inbound traffic"
}

variable "http_port" {
  description = "The HTTP port to allow inbound traffic"
}

variable "https_port" {
  description = "The HTTP port to allow inbound traffic"
}

variable "protocol" {
  description = "protocol"
}