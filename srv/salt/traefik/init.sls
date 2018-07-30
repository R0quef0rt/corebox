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