{% from 'docker/compose/build.sls' import compose_build with context %}
{% from 'docker/compose/up.sls' import compose_up with context %}

include:
  - grafana.datasources
  - grafana.dashboards

{{ compose_build('grafana') }}
{{ compose_up('grafana') }}

url-grafana:
  grains.list_present:
    - name: url-backend
    - value: grafana, http://{{ grains['ip4_interfaces']['enp2s0'][0] }}:3000