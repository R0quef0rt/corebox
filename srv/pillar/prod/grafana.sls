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
      datasource: Prometheus
    traefik-overview:
      instance: traefik_proxy_1
      protocol: http
      requests: 
      service:
      method: GET
      code: 200
      backend: backend-core-hugo
      datasource: Prometheus
      