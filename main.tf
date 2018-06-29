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

data "aws_ami" "minion" {
  most_recent = true
  owners      = ["self"]

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "name"
    values = ["${var.env}-${var.service_name}-*"]
  }
}

data "template_file" "minion-user-data" {
  template = "${file("${path.root}/setup.sh")}"
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
  ami           = "${data.aws_ami.minion.image_id}"

  user_data              = "${data.template_file.minion-user-data.rendered}"
  key_name               = "${var.env}"
  subnet_id              = "subnet-df80f097"
  vpc_security_group_ids = ["${aws_security_group.minion.id}"]

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = "${file("${path.root}/auth/${var.env}.key")}"
  }

  ebs_block_device {
    device_name           = "/dev/sdx"
    volume_size           = 5
    volume_type           = "gp2"
    delete_on_termination = false
  }

  ebs_block_device {
    device_name           = "/dev/sdy"
    volume_size           = 5
    volume_type           = "gp2"
    delete_on_termination = false
  }

  ebs_block_device {
    device_name           = "/dev/sdz"
    volume_size           = 5
    volume_type           = "gp2"
    delete_on_termination = false
  }

  provisioner "remote-exec" {
    inline = [
      "sudo salt-call --local state.highstate",
    ]
  }

  tags {
    Name        = "${var.project_key}-${var.service_name}-${var.env}"
    environment = "${var.env}"
    Terraform   = "true"
  }
}
