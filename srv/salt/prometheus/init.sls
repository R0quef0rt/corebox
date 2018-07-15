prometheus-config: 
  file.managed: 
    - template: jinja
    - source: salt://prometheus/files/prometheus.tpl.yml
    {% if saltenv == 'dev' %}
    - name: /app/dev/projects/prometheus/prometheus.yml
    {% elif saltenv == 'qa' or 'prod' %}
    - name: /app/live/projects/prometheus/prometheus.yml
    {% endif %}