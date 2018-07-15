{% for project in salt['pillar.get']('hugo:projects', '') %}
/app/live/projects/hugo/src/{{project}}:
  file.recurse:
    - source: salt://hugo/files/src
    - include_empty: True

hugo-{{project}}: 
  file.managed: 
    - template: jinja
    - source: salt://hugo/files/projects/{{project}}/config.tpl.toml
    - name: /app/live/projects/hugo/src/{{project}}/config.toml
{% endfor %}

