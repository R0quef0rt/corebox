dev:
  'os_family:Linux':
    - match: grain
    - common
    - system
  'os_family:RedHat':
    - match: grain
    - common
    - system
  'roles:docker':
    - match: grain
    - docker
    - docker.compose
    - docker.build
    - docker.up
  'roles:mariadb':
    - match: grain
    - mariadb
  'roles:nextcloud':
    - match: grain
    - nextcloud
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
  'base and G@os_family:Windows':
    - dsc.lcm
    - dsc.dependencies
    - dsc.updates
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
qa:
  'os_family:Linux':
    - match: grain
    - common
    - system
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
prod:
  'os_family:Linux':
    - match: grain
    - common
    - system
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