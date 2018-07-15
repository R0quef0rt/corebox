{% for project in salt['pillar.get']('hugo:projects', '') %}
hugo-{{project}}: 
  file.managed: 
    - template: jinja
    - source: salt://hugo/files/{{project}}/config.tpl.toml
    - name: /app/live/projects/hugo/src/{{project}}/config.toml
{% endfor %}

