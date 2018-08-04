{% from 'docker/compose/build.sls' import compose_build with context %}
{% from 'docker/compose/up.sls' import compose_up with context %}
{% from 'system/firewall.sls' import add_port with context %}

traefik-config: 
  file.managed: 
    - template: jinja
    - source: salt://traefik/files/traefik.tpl.toml
    - name: /app/live/projects/traefik/traefik.toml

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