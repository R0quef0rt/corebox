dev:
  '*':
    - common
    - system.timezone
    - system.firewall.devbox
    - docker
    - docker.compose
    - docker.compose-cmd
    - users.vagrant
    - users.terraform
    - users.master
prod:
  '*':
    - common
    - system.timezone
    - users.master