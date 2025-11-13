output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "security_group_id" {
  description = "Security Group ID"
  value       = aws_security_group.web_app.id
}

output "ec2_instance_id" {
  description = "EC2 Instance ID"
  value       = aws_instance.web_server.id
}

output "ec2_public_ip" {
  description = "EC2 Public IP"
  value       = aws_instance.web_server.public_ip
}