variable "ami" {
  description = "AMI"
}

variable "region" {
  default = "ap-south-1"
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

variable "jenkins_port" {
  description = "The HTTP port to allow inbound traffic"
}

variable "sonar_port" {
  description = "The HTTP port to allow inbound traffic"
}

variable "nexus_port" {
  description = "The HTTP port to allow inbound traffic"
}

variable "protocol" {
  description = "protocol"
}