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
  backend "s3" {
    encrypt = "true"
  }
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
  name        = "${var.env}-${var.service_name}-${var.os_family}-minion"
  description = "Used by the AWS instance."
  vpc_id      = "vpc-cd2d97b4"

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
  subnet_id              = "subnet-df80f097"
  vpc_security_group_ids = ["${aws_security_group.minion.id}"]

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = "${file("${var.private_key}")}"
  }

provisioner "salt-masterless" {
    "local_state_tree"   = "./srv/salt"
    "minion_config_file" = "./etc/salt/minion.ubuntu"
    "bootstrap_args"     = "-i cloudbox -U -F -P -p python-git"
    "salt_call_args"     = "--id cloudbox saltenv=${var.env} pillarenv=${var.env}"
}

  # provisioner "remote-exec" {
  #   inline = [
  #     "sudo salt-call --local --id cloudbox state.highstate saltenv=${var.env} pillarenv=${var.env} TEST=${var.test}",
  #   ]
  # }

  tags {
    Name        = "${var.project_key}-${var.service_name}-${var.env}"
    environment = "${var.env}"
    Terraform   = "true"
  }
}

resource "aws_key_pair" "main" {
  key_name = "${var.env}-${random_string.key_name.result}"

  public_key = "${var.public_key}"
}

resource "random_string" "key_name" {
  length  = 9
  special = false
}
