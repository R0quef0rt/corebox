{% from 'docker/build.sls' import compose_build with context %}
{% from 'docker/up.sls' import compose_up with context %}
{% from 'system/firewall.sls' import add_port with context %}
{% from 'grains/url.sls' import set_url with context %}

{{ compose_build('traefik') }}
{{ compose_up('traefik') }}

traefik-enabled:
  grains.present:
    - value: true

{{ set_url('traefik', 'backend', 'http', '/traefik') }}

{{ add_port('ssh', '22', 'tcp') }}
{{ add_port('traefik-http', '80', 'tcp') }}
{{ add_port('traefik-https', '443', 'tcp') }}