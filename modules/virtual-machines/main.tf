resource "aws_instance" "web" {
  count         = 2
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name        = "${var.instance_names[count.index]}"
    Environment = "dev"
  }

  key_name        = aws_key_pair.terraform-demo.key_name
  vpc_security_group_ids = [ aws_security_group.allow_ssh_http_sg.id ]
}

resource "null_resource" "hosts" {
  depends_on = [aws_instance.web]
  triggers = {
    time = "${timestamp()}"
  }
  count = length(aws_instance.web)

  provisioner "local-exec" {
    command = "echo ${element(aws_instance.web[*].public_ip, count.index)} >> ./hosts"
    when    = create
  }

  provisioner "local-exec" {
    command = "rm -f ./hosts"
    when    = destroy
  }
}