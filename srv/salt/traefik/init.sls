{% from 'docker/build.sls' import compose_build with context %}
{% from 'docker/up.sls' import compose_up with context %}
{% from 'system/firewall.sls' import add_port with context %}

{{ compose_build('traefik') }}
{{ compose_up('traefik') }}

traefik-enabled:
  grains.present:
    - value: true

url-traefik:
  grains.list_present:
    - name: url-backend
    - value: traefik, http://{{ grains['ip4_interfaces']['enp2s0'][0] }}/traefik

{{ add_port('ssh', '22', 'tcp') }}
{{ add_port('traefik-http', '80', 'tcp') }}
{{ add_port('traefik-https', '443', 'tcp') }}