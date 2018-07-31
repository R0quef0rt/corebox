firewall-rules:
  ssh:
    chain: INPUT
    jump: ACCEPT
    dport: 22
    protocol: tcp
  traefik-http:
    chain: INPUT
    jump: ACCEPT
    dport: 80
    protocol: tcp
  traefik-https:
    chain: INPUT
    jump: ACCEPT
    dport: 443
    protocol: tcp
  freeipa-http:
    chain: INPUT
    jump: ACCEPT
    dport: 8080
    protocol: tcp
  freeipa-https:
    chain: INPUT
    jump: ACCEPT
    dport: 8443
    protocol: tcp
  unifi-device:
    chain: INPUT
    jump: ACCEPT
    dport: 8080
    protocol: tcp
  unifi-web:
    chain: INPUT
    jump: ACCEPT
    dport: 8443
    protocol: tcp
  unifi-stun:
    chain: INPUT
    jump: ACCEPT
    dport: 3478
    protocol: udp
  unifi-discovery:
    chain: INPUT
    jump: ACCEPT
    dport: 10001
    protocol: udp
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
  prometheus:
    chain: INPUT
    jump: ACCEPT
    dport: 9090
    protocol: tcp
  alertmanager:
    chain: INPUT
    jump: ACCEPT
    dport: 9093
    protocol: tcp
  cadvisor:
    chain: INPUT
    jump: ACCEPT
    dport: 8484
    protocol: tcp
  elasticsearch-main:
    chain: INPUT
    jump: ACCEPT
    dport: 9200
    protocol: tcp
  elasticsearch-alt:
    chain: INPUT
    jump: ACCEPT
    dport: 9300
    protocol: tcp
  kibana:
    chain: INPUT
    jump: ACCEPT
    dport: 5601
    protocol: tcp
  logstash-syslog-tcp:
    chain: INPUT
    jump: ACCEPT
    dport: 5140
    protocol: tcp
  logstash-syslog-udp:
    chain: INPUT
    jump: ACCEPT
    dport: 5140
    protocol: udp
  logstash-beats-tcp:
    chain: INPUT
    jump: ACCEPT
    dport: 5044
    protocol: tcp
  logstash-beats-udp:
    chain: INPUT
    jump: ACCEPT
    dport: 5044
    protocol: udp
  gitlab-container:
    chain: INPUT
    jump: ACCEPT
    dport: 5000
    protocol: tcp