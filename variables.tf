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
  default     = "dev"
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
