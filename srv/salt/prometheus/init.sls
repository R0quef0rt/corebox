{% from 'docker/compose/build.sls' import compose_build with context %}
{% from 'docker/compose/up.sls' import compose_up with context %}
{% from 'system/firewall.sls' import add_port with context %}

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

{{ compose_build('prometheus') }}
{{ compose_up('prometheus') }}

{{ add_port('prometheus', '9090', 'tcp') }}
{{ add_port('alertmanager', '9093', 'tcp') }}
{{ add_port('cadvisor', '8484', 'tcp') }}