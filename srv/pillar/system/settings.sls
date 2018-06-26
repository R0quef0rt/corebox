timezone:
  main: America/Chicago

filesystem:
  mount: True

directory:
  /etc/nzbget:
    user: vagrant
    group: docker
    mode: 777
  /etc/sonarr:
    user: vagrant
    group: docker
    mode: 777
  /etc/radarr:
    user: vagrant
    group: docker
    mode: 777
  /etc/plex:
    user: vagrant
    group: docker
    mode: 777
  /etc/duplicati:
    user: vagrant
    group: docker
    mode: 777

users:
  masters:
    - master
    - vagrant
  services:
    - salt