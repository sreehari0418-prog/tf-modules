resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "${var.environment}-vpc"
  }
}
resource "aws_subnet" "public" {
  cidr_block        = var.public_subnet_cidr
  vpc_id            = aws_vpc.main.id
  availability_zone = var.public_subnet_az
}
resource "aws_subnet" "private" {
  cidr_block        = var.private_subnet_cidr
  vpc_id            = aws_vpc.main.id
  availability_zone = var.private_subnet_az
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
}
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}