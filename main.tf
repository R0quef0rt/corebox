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

data "terraform_remote_state" "environment" {
  backend = "s3"

  config {
    bucket = "cdi-tfstate-${var.account}-${var.env}-${var.region}"
    key    = "${var.provider}/devops/infrastructure/environment/${var.project_key}/terraform.tfstate"
    region = "${var.region}"
  }
}

data "aws_ami" "master" {
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

data "aws_ami" "minion" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-*"]
  }
}

data "aws_route53_zone" "main" {
  name         = "${var.env}.${var.service_name}.${data.terraform_remote_state.environment.domain_name}"
  private_zone = false
}

resource "aws_route53_record" "master" {
  zone_id = "${data.aws_route53_zone.main.zone_id}"
  name    = "master.${var.project_key}.${var.env}.${var.service_name}.${data.terraform_remote_state.environment.domain_name}"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.master.private_ip}"]
}

resource "aws_route53_record" "minion" {
  zone_id = "${data.aws_route53_zone.main.zone_id}"
  name    = "minion.${var.project_key}.${var.env}.${var.service_name}.${data.terraform_remote_state.environment.domain_name}"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.minion.private_ip}"]
}

data "template_file" "master-user-data" {
  template = "${file("${path.root}/srv/salt/scripts/master-user-data.sh")}"

  vars {
    SALT_VERSION    = "2018.3.0"
    MASTER_TEMPLATE = "${data.template_file.master-template.rendered}"
    MINION_TEMPLATE = "${data.template_file.master-minion.rendered}"
    MINION_ID       = "${var.project_key}-${var.env}-${var.service_name}-master"
  }
}

data "template_file" "minion-user-data" {
  template = "${file("${path.root}/srv/salt/scripts/minion-user-data.sh")}"

  vars {
    SALT_VERSION    = "2018.3.0"
    MINION_TEMPLATE = "${data.template_file.minion-template.rendered}"
    MINION_ID       = "${var.project_key}-${var.env}-${var.service_name}-minion"
  }
}

data "template_file" "master-template" {
  template = "${file("${path.root}/srv/salt/master.tpl")}"

  vars {
    AUTO_ACCEPT       = "auto_accept: ${var.auto_accept}"
    OPEN_MODE         = "open_mode: ${var.open_mode}"
    GITFS_SSL_VERIFY  = "gitfs_ssl_verify: False"
    LOG_LEVEL_LOGFILE = "log_level_logfile: info"

    STATE_TOP_SALTENV         = "state_top_saltenv: ${var.env}"
    ENV_ORDER                 = "env_order: ['dev', 'qa', 'prod']"
    TOP_FILE_MERGING_STRATEGY = "top_file_merging_strategy: same"

    GITFS_PROVIDER        = "gitfs_provider: pygit2"
    GITFS_UPDATE_INTERVAL = "gitfs_update_interval: 180"

    GITFS_USER          = "gitfs_user: '${var.git_user}'"
    GITFS_PASSWORD      = "gitfs_password: '${var.git_password}'"
    GIT_PILLAR_USER     = "git_pillar_user: '${var.git_user}'"
    GIT_PILLAR_PASSWORD = "git_pillar_password: '${var.git_password}'"

    GITFS_ROOT      = "gitfs_root: srv/salt/states"
    GITFS_BASE      = "gitfs_base: ${var.env}"
    GIT_PILLAR_BASE = "git_pillar_base: ${var.env}"

    EXT_PILLAR         = "${var.ext_pillar}"
    FILESERVER_BACKEND = "${var.fileserver_backend}"
    GITFS_REMOTES      = "${var.gitfs_remotes}"
    GITFS_SALTENV      = "${var.gitfs_saltenv}"
    REACTOR            = "${var.reactor}"
  }
}

data "template_file" "minion-template" {
  template = "${file("${path.root}/srv/salt/minion.tpl")}"

  vars {
    MASTER         = "master: ${aws_route53_record.master.name}"
    STARTUP_STATES = "startup_states: 'highstate'"
    ENVIRONMENT    = "environment: ${var.env}"
  }
}

data "template_file" "master-minion" {
  template = "${file("${path.root}/srv/salt/minion.tpl")}"

  vars {
    MASTER         = "master: 127.0.0.1"
    STARTUP_STATES = "startup_states: 'highstate'"
    ENVIRONMENT    = "environment: ${var.env}"
  }
}

resource "aws_security_group" "master" {
  name        = "${var.env}-${var.service_name}-master"
  description = "Used by the AWS instance."
  vpc_id      = "${data.terraform_remote_state.environment.vpc_id}"

  ingress {
    from_port = 4505
    to_port   = 4505
    protocol  = "TCP"

    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 4506
    to_port   = 4506
    protocol  = "TCP"

    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 8000
    to_port   = 8000
    protocol  = "TCP"

    cidr_blocks = ["0.0.0.0/0"]
  }

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

resource "aws_security_group" "minion" {
  name        = "${var.env}-${var.service_name}-minion"
  description = "Used by the AWS instance."
  vpc_id      = "${data.terraform_remote_state.environment.vpc_id}"

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

resource "aws_instance" "master" {
  instance_type = "t2.micro"
  ami           = "${data.aws_ami.master.image_id}"
  key_name      = "${data.terraform_remote_state.environment.ssh_key_name}"

  subnet_id = "${element(data.terraform_remote_state.environment.private_subnets, count.index)}"

  vpc_security_group_ids = ["${aws_security_group.master.id}"]

  user_data = "${data.template_file.master-user-data.rendered}"

  tags {
    Name        = "${var.project_key}-${var.service_name}-${var.env}-master-${count.index}"
    environment = "${var.env}"
    Terraform   = "true"
    extra_tags  = "IAM"
  }
}

resource "aws_instance" "minion" {
  instance_type = "t2.micro"
  ami           = "${data.aws_ami.minion.image_id}"
  key_name      = "${data.terraform_remote_state.environment.ssh_key_name}"

  subnet_id = "${element(data.terraform_remote_state.environment.private_subnets, count.index)}"

  vpc_security_group_ids = ["${aws_security_group.minion.id}"]

  user_data = "${data.template_file.minion-user-data.rendered}"

  tags {
    Name        = "${var.project_key}-${var.service_name}-${var.env}-minion-${count.index}"
    environment = "${var.env}"
    Terraform   = "true"
    extra_tags  = "IAM"
  }

  depends_on = ["aws_instance.master"]
}

resource "null_resource" "minion" {
  triggers {
    node           = "${join(",", aws_instance.minion.*.id)}"
    user-data      = "${sha256("${data.template_file.minion-user-data.rendered}")}"
    docker-compose = "${sha256(file("docker-compose.yml"))}"
  }

  connection {
    host        = "${element(aws_instance.minion.*.private_ip, count.index)}"
    type        = "ssh"
    user        = "ubuntu"
    private_key = "${file("~/.ssh/id_rsa")}"
  }

  provisioner "file" {
    source      = "docker-compose.yml"
    destination = "/tmp/docker-compose.yml"
  }

  depends_on = ["aws_instance.minion", "aws_instance.master"]
}
