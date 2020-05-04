dev:
  '*':
    - common
    - system.firewall
    - system.account
    - system.directory
    - docker
    - docker.compose
    - compose.up
qa:
  '*':
    - common
    - docker
    - docker.compose
prod:
  'G@os_family:Linux or G@os_family:RedHat':
    - match: grain
    - common
    - system
    - system.raid
  'roles:docker':
    - match: grain
    - docker
    - docker.compose
    - docker.build
    - docker.up
  'roles:mariadb':
    - match: grain
    - mariadb
  'roles:proxy':
    - match: grain
    - traefik
  'roles:wifi':
    - match: grain
    - unifi
  'roles:scm':
    - match: grain
    - gitlab
  'G@roles:ldap and G@os_family:Linux':
    - freeipa
  'G@roles:ldap and G@os_family:Windows':
    - dsc.lcm
    - dsc.dependencies
    - dsc.ad.pdc
    - dsc.ad.users
    - rapididentity
  'roles:mediaserver':
    - match: grain
    - nzbget
    - sonarr
    - radarr
    - plex
    - sync
    - duplicati
  'roles:siem':
    - match: grain
    - elasticsearch
    - prometheus
    - grafana
    - filebeat
  'roles:dashboard':
    - match: grain
    - hugo
  'roles:hypervisor':
    - match: grain
    - virtualbox
  'roles:imaging':
    - match: grain
    - packer