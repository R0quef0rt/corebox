{% from 'docker/build.sls' import compose_build with context %}
{% from 'docker/up.sls' import compose_up with context %}
{% from 'system/firewall.sls' import add_port with context %}
{% from 'grains/url.sls' import set_url with context %}

{{ compose_build('plex') }}
{{ compose_up('plex') }}

{{ set_url('plex', 'backend', 'http', ':32400') }}

{{ add_port('plex', '32400', 'tcp') }}
