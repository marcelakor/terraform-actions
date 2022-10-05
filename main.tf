terraform {
   cloud {
        organization = "marcel" /// replace with your organization name
        workspaces {
          name = "prod" /// replace with your workspace name
        }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.12.1"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1" # define region as per your account
}

resource "aws_s3_bucket" "bybybyt" {
  bucket = "demo-github--action-tf-medium"

  object_lock_enabled = false

  tags = {
    Environment = "Prod"
  }
}

resource "aws_instance" "test" {
  ami           = "ami-026b57f3c383c2eec"
  instance_type = "t2.micro"

  tags = {
    Name = "COUCOU"
  }
}
