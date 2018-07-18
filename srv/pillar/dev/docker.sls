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
  dashboards:
    prometheus-overview:
      instance: prometheus_app_1
      scrape_job: 1
      handler: 1
      interval: 15
      slice: 15
      quantile: 5m
