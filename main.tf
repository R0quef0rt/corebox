provider "aws" {
  region                  = var.region
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "default"
  version                 = "~> 2.60.0"
}

provider "random" {
  version = "~> 2.2.1"
}

locals {
  name = "${var.env == "dev" ? terraform.workspace : var.project_key}-${var.env}-${var.service_name}"
}

data "aws_ami" "main" {
  most_recent = true
  owners      = [var.ami_owner]

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "name"
    values = [var.ami_name]
  }
}

resource "aws_security_group" "main" {
  name        = "${local.name}-${random_string.main.result}"
  description = "Used by the AWS instance."
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "main" {
  key_name   = "${local.name}-${random_string.main.result}"
  public_key = file(var.public_key)
}

resource "aws_instance" "main" {
  count         = 1
  instance_type = "t2.micro"
  ami           = data.aws_ami.main.image_id

  key_name               = aws_key_pair.main.key_name
  subnet_id              = element(module.vpc.public_subnets, count.index)
  vpc_security_group_ids = [aws_security_group.main.id]

  # connection {
  #   host        = coalesce(self.public_ip, self.private_ip)
  #   type        = "ssh"
  #   user        = var.ssh_user
  #   private_key = file(var.private_key)
  # }

  tags = {
    Name        = local.name
    environment = var.env
    Terraform   = "True"
  }
}

resource "random_string" "main" {
  length  = 9
  special = false
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.service_name}-${var.env}-${random_string.main.result}"
  cidr = var.cidr_block

  azs             = [var.subnetaz1[var.region], var.subnetaz2[var.region], var.subnetaz3[var.region]]
  private_subnets = [cidrsubnet(var.cidr_block, 3, 1), cidrsubnet(var.cidr_block, 3, 2), cidrsubnet(var.cidr_block, 3, 3)]
  public_subnets  = [cidrsubnet(var.cidr_block, 4, 8), cidrsubnet(var.cidr_block, 4, 9), cidrsubnet(var.cidr_block, 4, 10)]

  create_vpc = true

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  enable_vpn_gateway   = false
  enable_dns_hostnames = true

  tags = {
    Name        = local.name
    environment = var.env
    Terraform   = "true"
  }
}

