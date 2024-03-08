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
    Name = "mywebserver-${terraform.workspace}-${count.index}"
    "Purpose" = var.instance_purpose[count.index]
  }
}

# Paste public key in authorized_keys file of newly created VMs
resource "null_resource" "copy_ssh_key" {
  count = length(aws_instance.ec2)

  connection {
    type        = "ssh"
    host        = aws_instance.ec2[count.index].public_ip
    user        = "ubuntu"                            # Change to your desired username
    private_key = file("./webapp.pem")                # Change to your private key path
  }
    
  provisioner "remote-exec" {
    inline = [
      "echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDArVKSMVU9SVZNa99Jun6ltAlQ4Y4f+1DxnJ03IJpQALkMtcjzsDm1r746F2bktzgIwf6GPKHi6a3clFgrC0y9Ki7ZrJBJ+GoaA7aHIHNnotb3tZSk6Z3lnWox2iaBTRkk29A1T2+sk7CDatBJJ1seXOyBp20bRe8OZdu3XXf4C8r5o5U9YRojjof4+xuwDqrWg0iVrVxhNlIroTqcUvx9jzrzkpxqBv9UAiji5/lpXxu2WjX+EVSsBJUpprRLpkpgbuQXFiQ645bsIPRz7psvxUFYU0TUTiU2loFQj6cTTi3lepNGc5BcUtB5BkPTVawocDzwuzrePtQwmkvs9TW7gXb+fCEnkYMQ2maaG09X+EX2ESTSWqYXmIw5wn58iM8pyeXNl+Yyp5D8vTMlcDIFScYVExpg4eE9Zseonz1CuflaLaNJiDjk2KPps8WjpW5Jr4cMTqoADFrP86iuq34HZxOvBoWNhVJT/9VHRI36Bvywixyfsj3bEaHbnFU6t9fXkpye/8tkzc+4ZgKVYYqF040nzlTlJCPkXZp0Xa6+TcQ9wfYGCSOktiYG5O3go061OT3IPpUvj2jcRs6vjAOj/jxBpuvXksWu+eXV4Yq39lyCk1+RG28np7KOnVOnMfl1twUPFjUHsNR1hyOEVdHUiwWlIygLDDgk5yC+TsolPw== user@DESKTOP-ENJQQBJ' >> ~/.ssh/authorized_keys" # Change to your public key
    ]
  }
}
