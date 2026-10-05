variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
}
variable "environment" {
    type        = string
    description = "The environment for the deployment (e.g., dev, prod)"
}
variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}
variable "public_subnet_id" {
  description = "The ID of the public subnet"
  type        = string
}
variable "private_subnet_id" {
  description = "The ID of the private subnet"
  type        = string
}
