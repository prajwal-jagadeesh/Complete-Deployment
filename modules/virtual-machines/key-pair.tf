resource "aws_key_pair" "terraform-demo" {
  key_name   = "terraform-ansible-integration"
  public_key = file("~/.ssh/id_rsa.pub")
}