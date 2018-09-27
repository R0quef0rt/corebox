dev:
  '*':
    - prod.system
    - prod.grafana
    - prod.hugo
    - dev.dsc
    - dev.mariadb
    - dev.nextcloud
    - prod.virtualbox
  'os_family:Linux':
    - match: grain
    - prod.Ubuntu.docker
  'os_family:RedHat':
    - match: grain
    - prod.CentOS.docker
qa:
  '*':
    - prod.system
    - prod.grafana
    - prod.hugo
    - dev.dsc
    - prod.virtualbox
  'os_family:Linux':
    - match: grain
    - prod.Ubuntu.docker
  'os_family:RedHat':
    - match: grain
    - prod.CentOS.docker
prod:
  '*':
    - prod.system
    - prod.grafana
    - prod.hugo
    - dev.dsc
    - prod.virtualbox
  'os_family:Linux':
    - match: grain
    - prod.Ubuntu.docker
  'os_family:RedHat':
    - match: grain
    - prod.CentOS.docker