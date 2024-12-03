# Define a variable for the AWS region to avoid hardcoding
# This allows us to reuse the configuration across different regions.
variable "region" {
  description = "Value of region to be used" # Explanation of what the variable is for
  type        = string                       # The type of the variable is a string
  default     = "us-east-1"                  # Default region if none is provided
}

# Specify Terraform configuration and required providers
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"             # Use the AWS provider from HashiCorp
      version = "5.78.0"                    # Specify the provider version to ensure consistency
    }
  }
}

# Configure the AWS provider
provider "aws" {
  # Use the region specified in the variable instead of a hardcoded value
  # This makes the configuration more flexible and reusable.
  region = var.region
}

# Create an AWS EC2 instance resource
resource "aws_instance" "myserver" {
  # The Amazon Machine Image (AMI) ID to use for the instance
  ami           = "ami-0866a3c8686eaeeba"  # Example AMI ID, specific to the chosen region
  instance_type = "t2.nano"                # Instance type suitable for lightweight workloads

  # Add tags to the instance for identification and organization
  tags = {
    Name = "SampleServer"                  # The Name tag to easily identify the instance
  }
}

# Notes:
# - Using variables like "region" ensures that you can easily switch or reuse configurations.
# - Tags are useful for tracking and managing resources in AWS.
# - Make sure the AMI ID is available in the specified region.
