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
'*':
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