dev:
  '*':
    - common
    - system.timezone
    - system.firewall
    - users.masters
    - users.services
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
    - users.masters
    - users.services
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
    - users.masters
    - users.services
    - docker
    - docker.compose
  'devbox':
    - docker.compose-cmd
    - filesystem.raid5