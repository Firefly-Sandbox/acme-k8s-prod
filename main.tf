
# Terraform v 1.5.0, has made importing resources into Terraform much simpler.
# Rather than using the terraform import command, you can now simply add the
# block to your Terraform code and actually import resources during an apply.

# The code was generated for this provider version (it can be changed to your preference). 

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.8.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}


import {
  to = aws_route_table.Kubernetes-Fargate
  id = "rtb-08bbd5e5328379242"
}

import {
  to = aws_vpc.Fargate-Internal
  id = "vpc-060c03b3f03576a62"
}

import {
  to = aws_vpc.Kubernetes
  id = "vpc-0f3358e78c0cb9a7f"
}

import {
  to = aws_internet_gateway.Kubernetes
  id = "igw-018e029e8e11c2aba"
}

import {
  to = aws_security_group.Kubernetes
  id = "sg-06e1bf43ed302d08a"
}

resource "aws_route_table" "Kubernetes-Fargate" {
  tags = {
    Name  = "Kubernetes-Fargate"
    owner = "Robert"
  }
  vpc_id = "vpc-0f3358e78c0cb9a7f"
}

resource "aws_vpc" "Fargate-Internal" {
  cidr_block                     = "10.0.0.0/24"
  enable_classiclink_dns_support = false
  tags = {
    Name    = "Fargate-Internal"
    owner   = "Robert"
    purpose = "firefly-sandbox"
  }
}

resource "aws_vpc" "Kubernetes" {
  cidr_block                     = "10.0.0.0/24"
  enable_classiclink_dns_support = false
  tags = {
    Name  = "Kubernetes"
    owner = "Robert"
  }
}

resource "aws_internet_gateway" "Kubernetes" {
  tags = {
    Name  = "Kubernetes"
    owner = "Robert"
  }
  vpc_id = "vpc-0f3358e78c0cb9a7f"
}

resource "aws_security_group" "Kubernetes" {
  description = "Minikube access"
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 443
    protocol    = "tcp"
    to_port     = 443
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
  }
  ingress {
    cidr_blocks = ["24.107.166.218/32"]
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }
  name = "Kubernetes"
  tags = {
    Name  = "Kubernetes"
    owner = "Robert"
  }
  vpc_id = "vpc-0f3358e78c0cb9a7f"
  # The following attributes have default values introduced when importing the resource into terraform: [revoke_rules_on_delete timeouts]
  lifecycle {
    ignore_changes = [revoke_rules_on_delete, timeouts]
  }
}

