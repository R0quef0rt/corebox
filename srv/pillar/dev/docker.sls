compose:
  projects:
    - traefik
    - hugo
    - prometheus
    - grafana

hugo:
  projects:
    - core
    - frontend

grafana:
  datasources:
    - prometheus