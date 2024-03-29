resource "aws_security_group" "allow_ssh_http_sg" {
  name        = "mysg-${terraform.workspace}"
  description = "Allow traffic on ${var.ssh_port}, ${var.http_port} and ${var.https_port} on ${terraform.workspace} env"

  ingress {
    description = "Allow Port 22 - SSH"
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = var.protocol
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow port 80 - HTTP"
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = var.protocol
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow port 443 - HTTPS"
    from_port   = var.https_port
    to_port     = var.https_port
    protocol    = var.protocol
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow Port 8080 - Jenkins"
    from_port   = var.jenkins_port
    to_port     = var.jenkins_port
    protocol    = var.protocol
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow Port 9000 - SonarQube"
    from_port   = var.sonar_port
    to_port     = var.sonar_port
    protocol    = var.protocol
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow Port 8081 - Nexus"
    from_port   = var.nexus_port
    to_port     = var.nexus_port
    protocol    = var.protocol
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    description = "Allow all ports"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}
