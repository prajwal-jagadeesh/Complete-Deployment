output "instance_id" {
  value = aws_instance.ec2[*].id
}

output "instance_public_ip" {
  value = aws_instance.ec2[*].public_ip
}

output "ec2_security_group_id" {
  value = aws_security_group.ec2-sg.id
}
