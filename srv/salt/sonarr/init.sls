sonarr-config: 
  file.managed: 
    - template: jinja
    - source: salt://sonarr/files/config.tpl.xml
    {% if saltenv == 'dev' %}
    - name: /app/dev/projects/sonarr/config/config.xml
    {% else %}
    - name: /app/live/projects/sonarr/config/config.xml
    {% endif %}