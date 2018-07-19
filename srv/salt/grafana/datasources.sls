datasources-directory:
  file.directory:
    - name: /app/live/projects/grafana/provisioning/datasources
    - makedirs: True

{% for datasource in salt['pillar.get']('grafana:datasources', '') %}
grafana-{{datasource}}-config: 
  file.managed: 
    - template: jinja
    - source: salt://grafana/files/datasource.tpl.yaml
    - name: /app/live/projects/grafana/provisioning/datasources/{{datasource}}.yaml
{% endfor %}