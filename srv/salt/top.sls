dev:
  '*':
    - common
    - system.timezone
    - system.firewall
    - users.masters
    - users.services
  'sandbox':
    - docker
    - docker.compose
    - docker.compose-cmd
  'devbox':
    - filesystem.raid5
prod:
  '*':
    - common
    - system
    - system.directory