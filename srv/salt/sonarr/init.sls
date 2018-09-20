{% from 'docker/build.sls' import compose_build with context %}
{% from 'docker/up.sls' import compose_up with context %}
{% from 'system/firewall.sls' import add_port with context %}
{% from 'grains/url.sls' import set_url with context %}

{{ compose_build('sonarr') }}
{{ compose_up('sonarr') }}

{{ set_url('sonarr', 'backend', 'http', ':8989') }}

{{ add_port('sonarr', '8989', 'tcp') }}