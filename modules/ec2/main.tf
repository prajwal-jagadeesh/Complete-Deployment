resource "aws_instance" "ec2" {
  count           = 4
  ami             = var.ami
  instance_type   = var.instance_type
  security_groups = var.security_group_id
  key_name        = "webapp"

  tags = {
    Name = "${var.instance_names[count.index]}-${terraform.workspace}"
  }
}
