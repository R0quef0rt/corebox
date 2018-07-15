{% for project in salt['pillar.get']('hugo:projects', '') %}
hugo-{{project}}: 
  file.managed: 
    - template: jinja
    - source: salt://hugo/files/{{project}}/config.tpl.toml
    {% if saltenv == 'dev' %}
    - name: /app/dev/projects/hugo/src/{{project}}/config.toml
    {% elif saltenv == 'qa' or 'prod' %}
    - name: /app/live/projects/hugo/src/{{project}}/config.toml
    {% endif %}
{% endfor %}

