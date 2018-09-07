# CoreBox [![Build Status](https://travis-ci.org/R0quef0rt/corebox.svg?branch=master)](https://travis-ci.org/R0quef0rt/corebox)

CoreBox is a (someday) production-ready, single-server solution for a DevOps beginner. It aims to bridge the difficult gap between putting automation technologies to good use, and learning the languages necessary to maintain a full stack. 

CoreBox is a developer's playground, build for modularity, speed of development, and ease of forking for your own project.

CoreBox aims to walk you, the developer or sysadmin, through all common lifecycle stages in the build automation pipeline process.

## Requirements

The following dependencies may or may not actually be required, depending on how you use this project. 

- A hypervisor (VirtualBox 5.2 or Hyper-V currently supported)
- Packer
- Vagrant

## Getting started

To start working with a local development environment, perform the following tasks:

1) Download this project from https://github.com/R0quef0rt/corebox

### Building a local image with Packer (only required for Windows development environments)

1) Using the command line, navigate to the location where you downloaded this project
2) Now, navigate to the appropriate "env" folder within this location. Choose a development environment (in my case, C:/Users/R0quef0rt/Documents/Repo/corebox/env/dev/Server2016)
3) Finally, run the following command: packer build -force -only=hyperv packer.json (replacing the 'only' flag with your preferred hypervisor)
4) Wait for the image to complete. In some cases, this can take upwards of 4 hours

The end result of this process will be a .box file in the ./output directory. This file is automatically ready to be used with Vagrant in your development environment.

### Launching your development environment with Vagrant

1) Using the command line, navigate to the location where you downloaded this project
2) Now, navigate to the appropriate "env" folder within this location. Choose a development environment (in my case, C:/Users/R0quef0rt/Documents/Repo/corebox/env/dev/Server2016)
3) To launch this environment using the default configuration (in this case, an Active Directory environment), run the following command: vagrant up
4) To use a different configuration, you must modify the "roles" grain in the ./etc/minion.windows configuration file. Of course, this role must be supported by the configuration in this repository.

## Incomplete

Information below this point is not well-documented. Updates will come in the near future.

### Salt

List all minions
salt-run manage.up

Apply highstate on all minions
salt '*' state.highstate saltenv=dev pillarenv=dev

Return fgdn for all minions
salt --local grains.item fqdn

Return all grains for every minion
salt '*' grains.items

Lookup job id results
salt-run jobs.lookup_jid <job id number>

List recently completed jobs
salt-run jobs.list_jobs

Test before highstate
salt-call --local state.highstate test=True


### Docker Compose

docker-compose up

docker-compose down

docker volume prune

### Travis CI

travis encrypt MY_SECRET_ENV=super_secret --add env.global

travis encrypt-file dev.key --add

### Hugo

sudo hugo server --bind="0.0.0.0"

hugo new site /home/master/journal

## MAJOR SECURITY ISSUES

- Plex docker-compose template has CLAIM_ID hardcoded. This gives a person FULL ACCESS to the account (I think)

### Known issues

- In prod, the root partition is running out of space. Probably because Docker mount should be moved to /mnt
- Race conditions. Sometimes requires salt highstate reapply

## To do

- Add CI, CD, CM, unit testing, integration testing
- Add Slack alerts and ChatOps functionality
- Support all 3 major cloud providers
- Support at least 3 linux distros, and Windows
- Example code for Terraform, Vagrant, Docker, Vault, Packer, Chef, Puppet, Test-Kitchen, Ansible, Gitlab CI, Travis CI
- Blue/Green deployments
- Provide secure defaults
- Setup reverse proxy
- Make a default landing page w/ links to all running apps
- Add a shared .vscode configuration to repo
- "CoreBox" on the landing page should display the hostname of the machine
- Random phrase generator below title
- Grafana, Prometheus, Alerts

### Due Dilligence

- Update WHOIS records

### Potential

- Dotmesh

### Constraints

- Your CI config should be IN THIS REPO. So that we can share it with others.
- This repo should generally not make an effort to configure the final applications. It should only provide a clean-slate for bootstrapping them, managing their lifecyle, etc
- All Docker images must come from official repos, unless unavailable

## READ

- https://timber.io/blog/promql-for-humans/