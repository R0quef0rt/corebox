variable "service_name" {
  description = "Name of this project"
  default     = "corebox"
}

variable "service_version" {
  description = "Version of this project"
  default     = "0.0.0"
}

variable "provider" {
  description = "Terraform cloud provider"
  default     = "aws"
}

variable "account" {
  description = "AWS account to connect with"
  default     = "dev"
}

variable "env" {
  description = "dev/qa/prod"
  default     = "qa"
}

variable "project_key" {
  description = "Per-customer isolation key"
  default     = "rjb"
}

variable "region" {
  description = "Region the services are deployed into."
  default     = "us-east-1"
}

variable "salt_version" {
  description = "The version of Salt to install"
  default     = "2018.3.2"
}

variable "test" {
  description = "Enable unit testing for Salt"
  default     = "false"
}

variable "os_family" {
  description = "Used to look up a matching operating system AMI"
  default     = "ubuntu"
}

variable "public_key" {
  description = "Public key used for SSH authentication"
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDcK6lPyYI4W5c+FIaIkJUWot2ToQpzf76VmYPgvoimRflpcG376CccwTY0FqPqwYNo2Pltzd7a/ZWhzxue4lWF4YAv02aWHYVR9WX27+fNgz9ZEEkuAfDnKXx1H2VFzFDA3PVNDqwHw1xWynLSgU6tVtUCRYyrVfYqdUsPQ6j29KGIymSvNXeSTboYAzWxzkpvc92kKCTG0BNPlRtUnJUVF1Qzc7hyNbq+tD3WBZZrU7OuhI/2kk2AtA2rnlkaG67yY0MVUXIsChENCCyf7esIhPycB8Njp0gE12svYQDkvGWKOgQnsxCXKWvVcW28ph/EuHiLCsRYPimB7PjLTcyj"
}