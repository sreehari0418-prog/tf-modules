resource "aws_security_group" "bastion" {
  name        = "${var.environment}-bastion-sg"
  description = "Security group for bastion host"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.environment}-bastion-sg"
  }
}
  resource "aws_security_group" "private" {
    name        = "${var.environment}-private-sg"
    description = "Security group for  private EC2 instances"
    vpc_id      = var.vpc_id

    ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      security_groups = [aws_security_group.bastion.id]
    }
  }
  resource "aws_instance" "ec2_bastion" {
    ami           = "ami-025d99823a4caad37"
    instance_type = var.instance_type
    subnet_id     = var.public_subnet_id
    associate_public_ip_address = true
    vpc_security_group_ids = [aws_security_group.bastion.id]
    tags = {
      Name = "${var.environment}-bastion-instance"
    }
  }
  resource "aws_instance" "ec2_private"{
    ami           = "ami-025d99823a4caad37"
    instance_type = var.instance_type
    subnet_id     = var.private_subnet_id
    associate_public_ip_address = false
    vpc_security_group_ids = [aws_security_group.private.id]
    tags = {
      Name = "${var.environment}-private-instance"
    }
  }