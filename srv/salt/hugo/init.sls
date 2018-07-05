{% for project in salt['pillar.get']('hugo:projects', '') %}
  {% for name, args in salt['pillar.get']('project', '') %}
hugo-{{name}}: 
  file.managed: 
    - source: salt://projects/hugo/src/{{name}}/config.toml.template
    - template: jinja
    {% if saltenv == 'dev' %}
    - name: /app/dev/projects/hugo/src/{{name}}/config.toml
    {% elif saltenv == 'qa' or 'prod' %}
    - name: /app/live/projects/hugo/src/{{name}}/config.toml
    {% endif %}
hugo-{{name}}-compose: 
  file.managed: 
    - source: salt://projects/hugo/docker-compose.yml.template
    - template: jinja
    {% if saltenv == 'dev' %}
    - name: /app/dev/projects/hugo/docker-compose.yml
    {% elif saltenv == 'qa' or 'prod' %}
    - name: /app/live/projects/hugo/docker-compose.yml
    {% endif %}
  {% endfor %}
{% endfor %}