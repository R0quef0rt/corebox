dev:
  '*':
    - common
    - system.timezone
    - mdadm.raid5
    # - system.directory
    # - system.firewall.devbox
    # - docker
    # - docker.compose
    # - docker.compose-cmd
    # - users.vagrant
prod:
  '*':
    - common
    - system
    - system.directory