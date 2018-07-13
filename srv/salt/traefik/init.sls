traefik-config: 
  file.managed: 
    - template: jinja
    - source: salt://traefik/files/traefik.tpl.toml
    {% if saltenv == 'dev' %}
    - name: /app/dev/projects/traefik/config/traefik.toml
    {% elif saltenv == 'qa' or 'prod' %}
    - name: /app/live/projects/traefik/config/traefik.toml
    {% endif %}