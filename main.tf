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

