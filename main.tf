provider "aws" {
  region                  = "${var.region}"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "default"
  version                 = "~> 1.40"
}

provider "random" {
  version = "~> 2.0"
}

terraform {
  required_version = ">= 0.11.4, < 0.12.0"
}

data "aws_ami" "minion" {
  most_recent = true
  owners      = ["self"]

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "name"
    values = ["${var.service_name}-${var.os_family}-*"]
  }
}

resource "aws_security_group" "minion" {
  name        = "${var.service_name}-${var.env}-minion-${random_string.main.result}"
  description = "Used by the AWS instance."
  vpc_id      = "${module.vpc.vpc_id}"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "TCP"

    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "minion" {
  instance_type = "t2.micro"
  ami           = "${data.aws_ami.minion.image_id}"

  key_name               = "${aws_key_pair.main.key_name}"
  subnet_id              = "${element(module.vpc.public_subnets, count.index)}"
  vpc_security_group_ids = ["${aws_security_group.minion.id}"]

  connection {
    type        = "ssh"
    user        = "${var.os_family}"
    private_key = "${file("${var.private_key}")}"
  }

  # provisioner "salt-masterless" {
  #     "local_state_tree"   = "${path.root}${var.env == "test" ? "/../../.." : ""}/srv/salt"
  #     "minion_config_file" = "${path.root}${var.env == "test" ? "/../../.." : ""}/etc/salt/minion.${var.os_family}"
  #     "bootstrap_args"     = "-i cloudbox -U -F -P -p python-git"
  #     "salt_call_args"     = "--id cloudbox saltenv=${var.env} pillarenv=${var.env}"
  # }

  provisioner "remote-exec" {
    inline = [
      "sudo salt-call --local --id cloudbox state.highstate saltenv=${var.env} pillarenv=${var.env} TEST=${var.salt_test}",
    ]
  }
  tags {
    Name        = "${var.project_key}-${var.service_name}-${var.env}"
    environment = "${var.env}"
    Terraform   = "true"
  }
}

resource "aws_key_pair" "main" {
  key_name = "${var.env}-${var.service_name}-${random_string.main.result}"

  public_key = "${file("${var.public_key}")}"
}

resource "random_string" "main" {
  length  = 9
  special = false
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.service_name}-${var.env}-${random_string.main.result}"
  cidr = "${var.cidr_block}"

  azs             = ["${lookup(var.subnetaz1, var.region)}", "${lookup(var.subnetaz2, var.region)}", "${lookup(var.subnetaz3, var.region)}"]
  private_subnets = ["${cidrsubnet(var.cidr_block, 3, 1)}", "${cidrsubnet(var.cidr_block, 3, 2)}", "${cidrsubnet(var.cidr_block, 3, 3)}"]
  public_subnets  = ["${cidrsubnet(var.cidr_block, 4, 8)}", "${cidrsubnet(var.cidr_block, 4, 9)}", "${cidrsubnet(var.cidr_block, 4, 10)}"]

  create_vpc = true

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  enable_vpn_gateway   = false
  enable_dns_hostnames = true

  tags = {
    Name        = "${var.project_key}-${var.service_name}-${var.env}"
    environment = "${var.env}"
    Terraform   = "true"
  }
}
