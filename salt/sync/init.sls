{% from 'docker/build.sls' import compose_build with context %}
{% from 'docker/up.sls' import compose_up with context %}
{% from 'system/firewall.sls' import add_port with context %}
{% from 'grains/url.sls' import set_url with context %}

{{ compose_build('sync') }}
{{ compose_up('sync') }}

{{ set_url('sync', 'backend', 'http', ':8888') }}

{{ add_port('sync-web', '8888', 'tcp') }}
{{ add_port('sync-proxy', '55555', 'tcp') }}