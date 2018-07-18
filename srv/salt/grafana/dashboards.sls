dashboards-directory:
  file.directory:
    - name: /app/live/projects/grafana/dashboards
    - makedirs: True

dashboards-config-directory:
  file.directory:
    - name: /app/live/projects/grafana/provisioning/dashboards
    - makedirs: True

{% for dashboard in salt['pillar.get']('grafana:dashboards', '') %}
grafana-{{dashboard}}-config: 
  file.managed: 
    - template: jinja
    - source: salt://grafana/files/dashboard.tpl.yaml
    - name: /app/live/projects/grafana/provisioning/dashboards/{{dashboard}}.yaml

grafana-{{dashboard}}-dashboard: 
  file.managed: 
    - template: jinja
    - source: salt://grafana/files/dashboards/{{dashboard}}.tpl.json
    - name: /app/live/projects/grafana/dashboards/{{dashboard}}.json
{% endfor %}