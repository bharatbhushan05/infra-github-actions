resource "aws_instance" "my_ec2" {
  ami           = "ami-0ecb62995f68bb549" # Ubuntu 22.04 (update as per region)
  instance_type = var.instance_type

  tags = {
    Name = "GitHubActions-EC2"
  }
}
