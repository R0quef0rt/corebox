variable "service_name" {
  description = "Name of this project"
  default     = "corebox"
}

variable "service_version" {
  description = "Version of this project"
  default     = "0.0.0"
}

variable "account" {
  description = "AWS account to connect with"
  default     = "dev"
}

variable "env" {
  description = "dev/qa/prod"
  default     = "dev"
}

variable "project_key" {
  description = "Per-customer isolation key"
  default     = "abc"
}

variable "region" {
  description = "Region the services are deployed into."
  default     = "us-east-1"
}

variable "subnetaz1" {
  description = "The availability zone to use for public subnet A."
  type        = map(string)

  default = {
    us-east-1      = "us-east-1a"
    us-east-2      = "us-east-2a"
    us-west-1      = "us-west-1a"
    us-west-2      = "us-west-2a"
    eu-west-1      = "eu-west-1a"
    eu-west-2      = "eu-west-2a"
    eu-central-1   = "eu-central-1a"
    ap-southeast-1 = "ap-southeast-1a"
  }
}

variable "subnetaz2" {
  description = "The availability zone to use for public subnet B."
  type        = map(string)

  default = {
    us-east-1      = "us-east-1b"
    us-east-2      = "us-east-2b"
    us-west-1      = "us-west-1b"
    us-west-2      = "us-west-2b"
    eu-west-1      = "eu-west-1b"
    eu-west-2      = "eu-west-2b"
    eu-central-1   = "eu-central-1b"
    ap-southeast-1 = "ap-southeast-1b"
  }
}

variable "subnetaz3" {
  description = "The availability zone to use for public subnet C."
  type        = map(string)

  default = {
    us-east-1      = "us-east-1c"
    us-east-2      = "us-east-2c"
    us-west-1      = "us-west-1c"
    us-west-2      = "us-west-2c"
    eu-west-1      = "eu-west-1c"
    eu-west-2      = "eu-west-2c"
    eu-central-1   = "eu-central-1c"
    ap-southeast-1 = "ap-southeast-1c"
  }
}

variable "salt_version" {
  description = "The version of Salt to install"
  default     = "2018.3.2"
}

variable "tf_test" {
  description = "Enable kitchen testing for Terraform"
  default     = "false"
}

variable "salt_test" {
  description = "Enable unit testing for Salt"
  default     = "false"
}

variable "ssh_user" {
  description = "Used to connect to the instance"
  default     = "ubuntu"
}

variable "public_key" {
  description = "Public key used for SSH authentication"
  default     = "./assets/key_pair/id_rsa.pub"
}

variable "private_key" {
  description = "Private key used for SSH authenticatoin"
  default     = "./assets/key_pair/id_rsa"
}

variable "rootpath" {
  description = "Path to the terraform module"
  default     = "/"
}

variable "cidr_block" {
  description = "The CIDR range to use for the VPC"
  default     = "10.0.0.0/16"
}

variable "dns_zone" {
  description = "The Route53 DNS zone"
  default     = "corebox.io"
}

variable "minion_config" {
  description = "Path to the minion config file"
  default     = "etc/salt/minion.qa"
}

variable "grains_config" {
  description = "Path to the grains config file"
  default     = "etc/salt/grains.qa"
}

variable "ami_name" {
  description = "The value of the AWS AMI ID to use"
  default     = "ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-arm64-server-20200430"
}

variable "ami_owner" {
  description = "The value of the AMI owner"
  default     = "099720109477"
}
