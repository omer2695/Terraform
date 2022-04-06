terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-2"
}

# Create a VPC
resource "aws_vpc" "omer" {
  cidr_block = "192.168.7.0/24"
  tags = {
    "name" = "omer-vpc"
  }
}

###### subnet_web #####
resource "aws_subnet" "subnet_web" {
  vpc_id     = aws_vpc.omer.id
  cidr_block = "192.168.7.0/27"

  tags = {
    Name = "subnet_web"
  }
}

  ###### subnet_app #####
resource "aws_subnet" "subnet_app" {
  vpc_id     = aws_vpc.omer.id
  cidr_block = "192.168.7.32/27"

  tags = {
    Name = "subnet_app"
  }
}

  ###### subnet_db #####
resource "aws_subnet" "subnet_db" {
  vpc_id     = aws_vpc.omer.id
  cidr_block = "192.168.7.64/28"

  tags = {
    Name = "subnet_db"
  }
}