dev:
  '*':
    - dev.system
    - dev.users
    - dev.docker
    - dev.grafana
qa:
  '*':
    - prod.system
    - qa.raid
    - prod.users
    - prod.docker
    - prod.firewall
    - qa.directory
prod:
  '*':
    - prod.system
    - prod.raid
    - prod.users
    - prod.docker
    - prod.firewall
    - prod.directory