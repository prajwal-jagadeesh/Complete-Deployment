resource "aws_instance" "ec2" {
  count         = 4
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = "webapp"

  tags = {
    Name = "${var.instance_names[count.index]}-${terraform.workspace}"
  }
}

# Paste public key in authorized_keys file of newly created VMs
resource "null_resource" "copy_ssh_key" {
  count = length(aws_instance.ec2)

  provisioner "remote-exec" {
    inline = [
      "echo '${file("~/.ssh/id_rsa.pub")}' >> ~/.ssh/authorized_keys",
      "chmod 700 ~/.ssh",
      "chmod 600 ~/.ssh/authorized_keys"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"              # Change if your instance uses a different username
      private_key = file("~/.ssh/id_rsa") # Path to your private key
      host        = aws_instance.ec2[count.index].public_ip
    }
  }
}
