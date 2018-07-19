dev:
  '*':
    - dev.system
    - dev.users
    - dev.docker
    - prod.grafana
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
    - prod.grafana
    - prod.hugo
prod:
  '*':
    - prod.system
    - prod.raid
    - prod.users
    - prod.docker
    - prod.hugo
    - prod.firewall
    - prod.directory
    - prod.grafana
    - prod.hugo