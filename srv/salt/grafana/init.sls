{% from 'docker/build.sls' import compose_build with context %}
{% from 'docker/up.sls' import compose_up with context %}
{% from 'grains/url.sls' import set_url with context %}

include:
  - grafana.datasources
  - grafana.dashboards

{{ compose_build('grafana') }}
{{ compose_up('grafana') }}

{{ set_url('grafana', 'backend', 'http', ':3000') }}