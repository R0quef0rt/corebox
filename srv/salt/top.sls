dev:
  '*':
    - common
    - system.timezone
    - system.firewall.devbox
    # - devbox
    - users.masters
  'sandbox':
    - docker
    - docker.compose
    # - docker.compose-cmd
    # - users.vagrant
  'devbox':
    - filesystem.raid5
prod:
  '*':
    - common
    - system
    - system.directory