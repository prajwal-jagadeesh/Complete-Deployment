variable "security_group_id" {
  description = "Security Group"
}

variable "subnet_ids" {
  description = "subnet Ids"
}

variable "vpc_id" {
  description = "vpc id"
}

variable "common_tags" {
  type    = map(string)
  default = {
    Environment = "dev"
    Owner       = "prajwal"
    Application = "Ekart"
  }
}
