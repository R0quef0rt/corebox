{% from 'docker/build.sls' import compose_build with context %}
{% from 'docker/up.sls' import compose_up with context %}
{% from 'system/firewall.sls' import add_port with context %}
{% from 'grains/url.sls' import set_url with context %}

{{ compose_build('radarr') }}
{{ compose_up('radarr') }}

{{ set_url('radarr', 'backend', 'http', ':7878') }}

{{ add_port('radarr', '7878', 'tcp') }}