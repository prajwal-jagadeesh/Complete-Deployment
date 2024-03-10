resource "aws_instance" "web" {
  count         = 3
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name        = "${var.instance_names[count.index]}"
    Environment = "dev"
  }

  key_name               = aws_key_pair.terraform-demo.key_name
  vpc_security_group_ids = [aws_security_group.allow_ssh_http_sg.id]
}

resource "null_resource" "hosts" {
  depends_on = [aws_instance.web]
  triggers = {
    time = "${timestamp()}"
  }
  count = length(aws_instance.web)

  connection {
    type        = "ssh"
    host        = aws_instance.web[count.index].public_ip
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    agent       = false
  }

  provisioner "remote-exec" {
    inline = [
      "echo ${file("~/.ssh/id_rsa.pub")} >> ~/.ssh/authorized_keys",
      "chmod 700 ~/.ssh",
      "chmod 600 ~/.ssh/authorized_keys"
    ]
  }
}