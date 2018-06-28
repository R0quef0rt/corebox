provider "aws" {
  region                  = "${var.region}"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "default"
}

terraform {
  required_version = ">= 0.9.3, != 0.9.5"

  backend "s3" {
    encrypt = "true"
  }
}

resource "aws_security_group" "minion" {
  name        = "${var.env}-${var.service_name}-minion"
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
  ami           = "ami-5cc39523"
  key_name      = "${var.env}"

  subnet_id = "subnet-df80f097"

  vpc_security_group_ids = ["${aws_security_group.minion.id}"]

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = "${file("${path.root}/auth/${var.env}.key")}"
  }

  provisioner "salt-masterless" {
    "local_state_tree"   = "${path.root}/srv/salt"
    "local_pillar_roots" = "${path.root}/srv/pillar"
    "disable_sudo"       = "false"
    "bootstrap_args"     = "-i cloudbox -F -P -p python-git"
    "minion_config_file" = "etc/salt/minion"
    "salt_call_args"     = "-i cloudbox"
  }

  tags {
    Name        = "${var.project_key}-${var.service_name}-${var.env}"
    environment = "${var.env}"
    Terraform   = "true"
  }
}
