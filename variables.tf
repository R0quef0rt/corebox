variable "service_name" {
  default = "devbox"
}

variable "service_version" {
  default = "0.0.0"
}

variable "provider" {
  default = "aws"
}

variable "account" {
  default = "dev"
}

variable "env" {
  default = "dev"
}

variable "project_key" {
  default = "rjb"
}

variable "region" {
  description = "Region the services are deployed into."
  default     = "us-east-1"
}

variable "test" {
  description = "Toggle unit testing for Salt"
  default     = "false"
}
