provider "aws" {
    region = "ap-south-1"
}
# Create a VPC
resource "aws_vpc" "main" {
 # cidr_block       = "172.20.0.0/16"
   cidr_block   = var.vpc_cidr
  instance_tenancy = "default"
  
  tags = {
    Name = "my-new-test-vpc"
    Location = "chennai"
    Envirnment = terraform.workspace
  }
}

# creating public subnet
resource "aws_subnet" "main" {
   count = length(data.aws_availability_zones.available.names)
   vpc_id = aws_vpc.main.id
   cidr_block = var.Public_subnet_cidr[count.index]
   availability_zone       = data.aws_availability_zones.available.names[count.index]
  tags = {
    Name = "my-test-public-subnet.${count.index + 1}"
    Location = "chennai"
    Envirnment = terraform.workspace
  }
}

terraform {
  backend "s3" {
    bucket = "tfstatefiletest"
    key    = "terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "terraform-lock"
  }
}

