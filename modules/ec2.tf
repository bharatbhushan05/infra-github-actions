resource "aws_instance" "master_node" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.web_app.id]
  subnet_id              = aws_subnet.public.id
  
  tags = {
    Name        = "master_node"
    Environment = var.environment
    Project     = var.project_name
  }
 }

resource "aws_instance" "worker_node" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.web_app.id]
  subnet_id              = aws_subnet.public.id
  
  tags = {
    Name        = "worker_node"
    Environment = var.environment
    Project     = var.project_name
  }
 

}