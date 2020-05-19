# CoreBox

Travis-CI: [![Build Status](https://travis-ci.com/R0quef0rt/corebox.svg?branch=master)](https://travis-ci.com/R0quef0rt/corebox)

CoreBox is a production-ready, single-server example of DevOps technologies in practice.

## Development
To build a local development environment, use the following:

`vagrant up`

To build a cloud development environment, use the following:

`packer build packer.json`

`terraform init`

`terraform plan`

`terraform apply`

To clean up your environments, run the following:

`vagrant destroy`

`terraform destroy`

## Testing
To test the local environment, use the following:

`kitchen converge default-vagrant`

`kitchen verify default-vagrant`

To test the cloud environment, use the following:

`kitchen converge default-terraform`

`kitchen verify default-terraform`

To clean up test environments, use the following:

`kitchen destroy`