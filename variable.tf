
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}
variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet"
  type        = string
}
variable "public_subnet_az" {
  description = "The availability zone for the public subnet"
  type        = string
}
variable "private_subnet_cidr" {
  description = "The CIDR block for the private subnet"
  type        = string
}
variable "private_subnet_az" {
  description = "The availability zone for the private subnet"
  type        = string
}
variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
}
variable "environment" {
  description = "The environment for the deployment (e.g., dev, prod)"
  type        = string
  validation {
    condition     = contains(["dev", "prod"], var.environment)
    error_message = "Environment must be either 'dev' or 'prod'."
  }
}
variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
}