dev:
  '*':
    - common
    - system.timezone
    - system.firewall.devbox
    - docker
    - docker.compose
    - docker.compose-cmd
    - users.vagrant
prod:
  '*':
    - common
    - system
    - system.directory