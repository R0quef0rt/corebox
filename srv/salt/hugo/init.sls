{% for project in salt['pillar.get']('hugo:projects', '') %}
hugo-{{project}}: 
  file.managed: 
    - template: jinja
    {% if saltenv == 'dev' %}
    - source: /app/dev/projects/hugo/src/{{project}}/config.tpl.toml
    - name: /app/dev/projects/hugo/src/{{project}}/config.toml
    {% elif saltenv == 'qa' or 'prod' %}
    - source: /app/live/projects/hugo/src/{{project}}/config.tpl.toml
    - name: /app/live/projects/hugo/src/{{project}}/config.toml
    {% endif %}
{% endfor %}