dev:
  '*':
    - common
    - system.timezone
    - system.firewall.devbox
    # - devbox
    - users.masters
    - users.services
  'sandbox':
    - docker
    - docker.compose
    # - docker.compose-cmd
  'devbox':
    - filesystem.raid5
prod:
  '*':
    - common
    - system
    - system.directory