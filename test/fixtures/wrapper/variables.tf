variable "project_key" {
  description = <<EOD
Per-customer isolation key
EOD

  type = string
}

variable "env" {
  description = <<EOD
Environment
EOD

  type = string
}
