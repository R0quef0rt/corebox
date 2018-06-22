dev:
  '*':
    - common
    - system.timezone
    - system.firewall
    - system.directory
    - docker
    - docker.compose
    - users.vagrant
qa:
  '*':
    - common
prod:
  '*':
    - common