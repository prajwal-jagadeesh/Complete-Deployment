variable "ami" {
  description = "AMI"
}

variable "security_group_id" {
  description = "Security Group"
}

variable "subnet_id" {
  description = "subnet Id"
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
