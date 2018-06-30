raid: True
dir_set_perms: True

timezone:
  default: America/Chicago

users:
  masters:
    - master
  services:
    nzbget:
      uid: 1002
    sonarr:
      uid: 1003
    radarr:
      uid: 1004
    plex:
      uid: 1005
    duplicati:
      uid: 1006
    sync:
      uid: 1007
      
firewall-rules:
  ssh:
    chain: INPUT
    jump: ACCEPT
    dport: 22
    protocol: tcp
  nzbget:
    chain: INPUT
    jump: ACCEPT
    dport: 6789
    protocol: tcp
  sonarr:
    chain: INPUT
    jump: ACCEPT
    dport: 8989
    protocol: tcp
  radarr:
    chain: INPUT
    jump: ACCEPT
    dport: 7878
    protocol: tcp
  duplicati:
    chain: INPUT
    jump: ACCEPT
    dport: 8200
    protocol: tcp
  sync-web:
    chain: INPUT
    jump: ACCEPT
    dport: 8888
    protocol: tcp
  sync-api:
    chain: INPUT
    jump: ACCEPT
    dport: 55555
    protocol: tcp
  plex:
    chain: INPUT
    jump: ACCEPT
    dport: 32400
    protocol: tcp

directory:
  /etc/nzbget:
    user: master
    group: nzbget
    mode: 776
    recurse: False
  /etc/sonarr:
    user: master
    group: sonarr
    mode: 776
    recurse: False
  /etc/radarr:
    user: master
    group: radarr
    mode: 776
    recurse: False
  /etc/plex:
    user: master
    group: plex
    mode: 776
    recurse: False
  /etc/duplicati:
    user: master
    group: duplicati
    mode: 776
    recurse: False
  /etc/sync:
    user: master
    group: sync
    mode: 776
    recurse: False
  /mnt:
    user: master
    group: docker
    mode: 777
    recurse: True