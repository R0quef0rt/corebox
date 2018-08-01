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

{% from 'docker/compose/build.sls' import compose_build with context %}
{{ compose_build('traefik') }}
{% from 'docker/compose/up.sls' import compose_up with context %}
{{ compose_up('traefik') }}