timezone:
  main: America/Chicago

filesystem:
  mount: True

directory:
  nzbget: /etc/nzbget
    user: vagrant
    group: docker
    mode: 777
  sonarr: /etc/sonarr
    user: vagrant
    group: docker
    mode: 777
  radarr: /etc/radarr
    user: vagrant
    group: docker
    mode: 777
  plex: /etc/plex
    user: vagrant
    group: docker
    mode: 777
  duplicati: /etc/duplicati
    user: vagrant
    group: docker
    mode: 777

users:
  - vagrant