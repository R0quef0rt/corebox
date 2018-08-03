dev:
  'roles:common':
    - match: grain
    - common
    - system
  'roles:docker':
    - match: grain
    - docker
    - docker.compose
  'roles:proxy':
    - match: grain
    - traefik
  'roles:wifi':
    - match: grain
    - unifi
  'roles:scm':
    - match: grain
    - gitlab
  'roles:ldap and os:Ubuntu':
    - match: grain
    - freeipa
  'roles:ldap and os:Windows':
    - match: grain
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
qa:
  '*':
    - common
    - system
    - system.repo
  'devbox':
    - system.raid
  'roles:docker':
    - match: grain
    - docker
    - docker.compose
  'roles:proxy':
    - match: grain
    - traefik
  'roles:wifi':
    - match: grain
    - unifi
  'roles:scm':
    - match: grain
    - gitlab
  'roles:ldap':
    - match: grain
    - freeipa
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
prod:
  '*':
    - common
    - system
    - system.repo
  'devbox':
    - system.raid
  'roles:docker':
    - match: grain
    - docker
    - docker.compose
  'roles:proxy':
    - match: grain
    - traefik
  'roles:wifi':
    - match: grain
    - unifi
  'roles:scm':
    - match: grain
    - gitlab
  'roles:ldap':
    - match: grain
    - freeipa
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