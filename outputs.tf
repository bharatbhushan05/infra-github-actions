output "ec2_public_ip" {
  value = aws_instance.master_ec2.public_ip
}

output "ec2_public_ip" {
  value = aws_instance.worker_ec2.public_ip
}