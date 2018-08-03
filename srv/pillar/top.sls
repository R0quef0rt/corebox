dev:
  '*':
    - prod.system
    - prod.grafana
    - prod.hugo
    - dev.dsc
qa:
  '*':
    - prod.system
    - qa.raid
    - prod.grafana
    - prod.hugo
prod:
  '*':
    - prod.system
    - prod.raid
    - prod.grafana
    - prod.hugo