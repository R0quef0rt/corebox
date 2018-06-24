dev:
  '*':
    - common
    - system.timezone
    - system.firewall.devbox
    - docker
    - docker.compose
    - docker.compose-cmd
    - users.vagrant
    - users.master
qa:
  '*':
    - common
    - system.timezone
    - users.master
prod:
  '*':
    - common
    - system.timezone
    - users.terraform
    - users.master