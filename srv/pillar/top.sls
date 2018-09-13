dev:
  '*':
    - prod.system
    - prod.docker
    - prod.grafana
    - prod.hugo
    - dev.dsc
qa:
  '*':
    - prod.system
    - prod.docker
    - qa.raid
    - prod.grafana
    - prod.hugo
prod:
  '*':
    - prod.system
    - prod.docker
    - prod.raid
    - prod.grafana
    - prod.hugo