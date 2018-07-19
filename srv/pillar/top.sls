dev:
  '*':
    - dev.system
    - dev.users
    - dev.docker
    - dev.grafana
    - prod.hugo
qa:
  '*':
    - prod.system
    - qa.raid
    - prod.users
    - prod.docker
    - prod.hugo
    - prod.firewall
    - qa.directory
prod:
  '*':
    - prod.system
    - prod.raid
    - prod.users
    - prod.docker
    - prod.hugo
    - prod.firewall
    - prod.directory