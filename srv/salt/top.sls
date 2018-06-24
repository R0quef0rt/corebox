dev:
  '*':
    - common
    - system.timezone
    - system.firewall.devbox
    - system.directory
    - docker
    - docker.compose
    - docker.compose-cmd
    - users.vagrant
prod:
  '*':
    - common
    - system