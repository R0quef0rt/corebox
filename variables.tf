variable "service_name" {
  default = "cm"
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
  default = "cdi"
}

variable "region" {
  description = "Region the services are deployed into."
  default     = "us-east-1"
}

variable "git_user" {
  default = "ryan.brooks"
}

variable "git_password" {
  default = "kVqwWN9jZQ2iy6rG_Mfx"
}

variable "auto_accept" {
  default = "False"
}

variable "open_mode" {
  default = "False"
}

variable "fileserver_backend" {
  type = "string"

  default = <<EOF
fileserver_backend:
  - git
EOF
}

variable "gitfs_remotes" {
  type = "string"

  default = <<EOF
gitfs_remotes:
  - https://cd-svr-gitlab.cyberglobal.local/devops/services/cm.git
EOF
}

variable "gitfs_saltenv" {
  type = "string"

  default = <<EOF
gitfs_saltenv:
  - dev:
    - ref: dev
  - qa:
    - ref: master
  - prod:
    - ref: stable
EOF
}

variable "ext_pillar" {
  type = "string"

  default = <<EOF
ext_pillar:
  - git:
    - dev https://cd-svr-gitlab.cyberglobal.local/devops/services/cm.git:
      - env: dev
      - root: srv/salt/pillars
      - ssl_verify: False
    - master https://cd-svr-gitlab.cyberglobal.local/devops/services/cm.git:
      - env: qa
      - root: srv/salt/pillars
      - ssl_verify: False
    - stable https://cd-svr-gitlab.cyberglobal.local/devops/services/cm.git:
      - env: prod
      - root: srv/salt/pillars
      - ssl_verify: False
EOF
}

variable "reactor" {
  type = "string"

  default = <<EOF
reactor:
  - 'salt/minion/*/start':
    - salt://reactor/highstate.sls

  - 'salt/minion/*/start':
    - salt://reactor/docker-compose.sls
EOF
}
