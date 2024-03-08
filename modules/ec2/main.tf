resource "aws_instance" "ec2" {
  count         = 4
  ami           = var.ami
  instance_type = var.instance_type

  user_data = <<-EOF
                #!/bin/bash
                sudo apt-get update -y
                sudo apt-get install -y awscli
                chmod 700 ~/.ssh
                chmod 600 ~/.ssh/authorized_keys
              EOF

  tags = {
    Name = "${var.instance_names[count.index]}-${terraform.workspace}-${count.index}"
  }
}

# Paste public key in authorized_keys file of newly created VMs
resource "null_resource" "copy_ssh_key" {
  count = length(aws_instance.ec2)

  connection {
    type        = "ssh"
    host        = aws_instance.ec2[count.index].public_ip
    user        = "ubuntu"                            # Change to your desired username
    private_key = file("~/.ssh/id_rsa")                # Change to your private key path
  }
    
  provisioner "remote-exec" {
    inline = [
      "echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDkndMMNnne0tjbizpvk3ybU9pVXUdCIOlp8TNJq5f1cbZm9HUs73OdPfjNauiPZWSYuZzOEYPSVq0Dg1NAvTb6xCrR/ML1FXFqaSaLgDrggayoy326rEYuwysFbPPcuda5GYTGmbH8txn+VX+Bh2ct3rJbBAK8G/9L+oZxkMmT3wqkW9uDyFbtFaNaYE31xvw3bIrMM6K7twuM++rmD2/nUF8sSX7TtDIAFQXOYxNB7Ie8tNAOGgtlitfgeTfADRhWEBv5nhjehqBg3bnF4SzcFbQQAOuYjXyIcAKceKHysmTs1dCy8R3obOUinlrAUl+i1pKXWz9H9KT4t0YJO1oR8A7DGKR8vtFUAJrrzRj06beQp3xJG0Hx9nJTNXvuaKV8ENl6Te9hLt/wn3+VKs/Tr/HudHhenHwSTqHmTZ5kGrV4ot4+PeoyscFdJtTPZIoz/tCGlEQgpiwADaAKG+IbCt4/5/4bqb5c3VwxQKtAazXFyvyFo5CcOA0iAPJq05eXq7Y6JjJciXojrUD4MSPPEREGEKA+fHPhUhg+rNOL2T96dKi//aPiyUHID6cHjVIeLHba+iYgpF+f/IXrgSWJqXm9JBnEmotwSrbKrys3RSR9lOc4acGUUeRfGxEsCv845sAGvVFHz4UDHh57tn8Z6pTkM+UXx17SeQVN1qJ69Q== ubuntu@ip-172-31-14-242' >> ~/.ssh/authorized_keys" # Change to your public key
    ]
  }
}
