
# Output the public IP address of the EC2 instance
output "aws_instance_public_ip" {
  value = aws_instance.myserver.public_ip # Retrieve and display the public IP address of the created instance

  # Notes:
  # - Outputs are useful for displaying important information after applying a Terraform configuration.
  # - This will help in quickly accessing the public IP without manually checking the AWS console.
}