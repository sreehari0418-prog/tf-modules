output "bastion_instance_id" {
  description = "The ID of the bastion EC2 instance"
  value       = aws_instance.ec2_bastion.id
}
output "private_instance_id" {
  description = "The ID of the private EC2 instance"
  value       = aws_instance.ec2_private.id
}