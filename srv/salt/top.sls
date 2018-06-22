dev:
  '*':
    - common
    - system.timezone
    - system.firewall
    - docker
    - docker.containers
    - docker.compose-ng
    - users.vagrant
qa:
  '*':
    - common
    - system
prod:
  '*':
    - common
    - system