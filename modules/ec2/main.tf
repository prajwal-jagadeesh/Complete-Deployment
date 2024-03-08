resource "aws_instance" "ec2" {
  count                       = 4
  ami                         = var.ami
  instance_type               = var.instance_type
  vpc_security_group_ids      = [var.security_group_id]
  key_name                    = "webapp"
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true

  tags = {
    Name = "${var.instance_names[count.index]}"
  }
}