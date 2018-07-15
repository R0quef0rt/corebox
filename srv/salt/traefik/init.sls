traefik-config: 
  file.managed: 
    - template: jinja
    - source: salt://traefik/files/traefik.tpl.toml
    - name: /app/live/projects/traefik/traefik.toml