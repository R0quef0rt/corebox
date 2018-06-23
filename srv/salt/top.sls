dev:
  '*':
    - common
    - system.timezone
    - system.firewall.seedbox
    - docker
    - docker.compose
    - docker.compose-cmd
    - users.vagrant
qa:
  '*':
    - common
    - system
prod:
  '*':
    - common
    - system