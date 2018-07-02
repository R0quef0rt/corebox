# DevBox [![Build Status](https://travis-ci.org/R0quef0rt/devbox.svg?branch=dev)](https://travis-ci.org/R0quef0rt/devbox)

## Salt

List all minions
salt-run manage.up

Apply highstate on all minions
salt '*' state.highstate saltenv=dev pillarenv=dev

Return fgdn for all minions
salt '*' grains.item fqdn

Return all grains for every minion
salt '*' grains.items

Lookup job id results
salt-run jobs.lookup_jid <job id number>

List recently completed jobs
salt-run jobs.list_jobs

Test before highstate
salt-call --local state.highstate test=True


## Docker Compose

docker-compose up

docker-compose down

docker volume prune

## Travis CI

travis encrypt MY_SECRET_ENV=super_secret --add env.global

travis encrypt-file dev.key --add

## Hugo

sudo hugo server --bind="0.0.0.0"

hugo new site /home/master/journal


### To do

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

### Requirements

- Your CI config should be IN THIS REPO. So that we can share it with others.