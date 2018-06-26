dev:
  '*':
    - common
    - system.timezone
    - system.firewall
    - system.directory
    - system.users
    # - groups
    - docker
    - docker.compose
  'sandbox':
    - docker.compose-cmd
  'devbox':
    - filesystem.raid5
qa:
  '*':
    - common
    - system.timezone
    - system.directory
    - users
    - docker
    - docker.compose
  'devbox':
    - docker.compose-cmd
    - filesystem.raid5
prod:
  '*':
    - common
    - system.timezone
    - system.directory
    - users
    - docker
    - docker.compose
  'devbox':
    - docker.compose-cmd
    - filesystem.raid5