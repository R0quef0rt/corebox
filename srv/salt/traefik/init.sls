{% from 'docker/compose/build.sls' import compose_build with context %}
{% from 'docker/compose/up.sls' import compose_up with context %}
{% from 'system/firewall.sls' import add_port with context %}

traefik-config: 
  file.managed: 
    - template: jinja
    - source: salt://traefik/files/traefik.tpl.toml
    - name: /app/live/projects/traefik/traefik.toml

traefik-enabled:
  grains.present:
    - value: true

traefik-url:
  grains.present:
    - value: http://{{ grains['ipv4']|last }}/traefik

{{ compose_build('traefik') }}
{{ compose_up('traefik') }}

{{ add_port('ssh', '22', 'tcp') }}
{{ add_port('traefik-http', '80', 'tcp') }}
{{ add_port('traefik-https', '443', 'tcp') }}