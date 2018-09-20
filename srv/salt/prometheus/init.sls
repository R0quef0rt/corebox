{% from 'docker/build.sls' import compose_build with context %}
{% from 'docker/up.sls' import compose_up with context %}
{% from 'system/firewall.sls' import add_port with context %}
{% from 'grains/url.sls' import set_url with context %}

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

{{ set_url('prometheus', 'backend', 'http', ':9090') }}
{{ set_url('alertmanager', 'backend', 'http', ':9093') }}
{{ set_url('cadvisor', 'backend', 'http', ':8484') }}

{{ add_port('prometheus', '9090', 'tcp') }}
{{ add_port('alertmanager', '9093', 'tcp') }}
{{ add_port('cadvisor', '8484', 'tcp') }}