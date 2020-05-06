timezone: America/Chicago

firewall:
  - name: ssh
    dport: 22
    protocol: tcp
  - name: duplicati
    dport: 8200
    protocol: tcp
  - name: plex
    dport: 32400
    protocol: tcp
  - name: radarr
    dport: 7878
    protocol: tcp
  - name: sonarr
    dport: 8989
    protocol: tcp
  - name: sync-web
    dport: 8888
    protocol: tcp
  - name: sync-proxy
    dport: 55555
    protocol: tcp

account:
  - name: master
    uid: 1050
    gid: 1050
  - name: media
    uid: 7000
    gid: 7000

directory:
  - name: mount
    path: /mnt
    user: media
    group: media
    mode: 650
    recurse: true
