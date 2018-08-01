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

{% from 'docker/compose/build.sls' import compose_build with context %}
{{ compose_build('prometheus') }}
{% from 'docker/compose/up.sls' import compose_up with context %}
{{ compose_up('prometheus') }}