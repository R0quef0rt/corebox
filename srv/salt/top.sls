dev:
  '*':
    - common
    - system.timezone
    - filesystem.raid5
    # - system.directory
    # - system.firewall.devbox
    # - docker
    # - docker.compose
    # - docker.compose-cmd
    - users.master
prod:
  '*':
    - common
    - system
    - system.directory