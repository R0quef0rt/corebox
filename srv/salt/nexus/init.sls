{% from 'docker/build.sls' import compose_build with context %}
{% from 'docker/up.sls' import compose_up with context %}
{% from 'system/firewall.sls' import add_port with context %}
{% from 'grains/url.sls' import set_url with context %}

{{ compose_build('nexus') }}
{{ compose_up('nexus') }}

{{ set_url('nexus', 'backend', 'http', ':8081') }}

{{ add_port('nexus-http', '8081', 'tcp') }}