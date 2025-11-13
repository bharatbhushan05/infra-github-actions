resource "aws_instance" "master_ec2" {
  ami           = "ami-0ecb62995f68bb549" # Ubuntu 22.04 (update as per region)
  instance_type = var.instance_type

  tags = {
    Name = "master-node"
  }
}

resource "aws_instance" "worker_ec2" {
  ami           = "ami-0ecb62995f68bb549" # Ubuntu 22.04 (update as per region)
  instance_type = var.instance_type

  tags = {
    Name = "worker-node"
  }
}`