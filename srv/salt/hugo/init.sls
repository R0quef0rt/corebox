{% for project in salt['pillar.get']('hugo:projects', '') %}

hugo-{{project}}: 
  file.managed: 
    - source: salt://projects/hugo/src/{{project}}/config.toml.template
    - template: jinja
    {% if saltenv == 'dev' %}
    - name: /app/dev/projects/hugo/src/{{project}}/config.toml
    {% elif saltenv == 'qa' or 'prod' %}
    - name: /app/live/projects/hugo/src/{{project}}/config.toml
    {% endif %}

hugo-{{project}}-compose: 
  file.managed: 
    - source: salt://projects/hugo/docker-compose.yml.template
    - template: jinja
    {% if saltenv == 'dev' %}
    - name: /app/dev/projects/hugo/docker-compose.yml
    {% elif saltenv == 'qa' or 'prod' %}
    - name: /app/live/projects/hugo/docker-compose.yml
    {% endif %}

{% endfor %}