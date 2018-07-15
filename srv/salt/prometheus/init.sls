prometheus-config: 
  file.managed: 
    - template: jinja
    - source: salt://prometheus/files/prometheus.tpl.yml
    - name: /app/live/projects/prometheus/prometheus.yml

alertmanager-config: 
  file.managed: 
    - template: jinja
    - source: salt://prometheus/files/alertmanager.tpl.conf
    - name: /app/live/projects/prometheus/alertmanager.conf