firewall-rules:
  ssh:
    chain: INPUT
    jump: ACCEPT
    dport: 22
    protocol: tcp
  traefik:
    chain: INPUT
    jump: ACCEPT
    dport: 80
    protocol: tcp
  traefik-api:
    chain: INPUT
    jump: ACCEPT
    dport: 8080
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