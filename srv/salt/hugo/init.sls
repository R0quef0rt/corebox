hugo-frontend: 
  file.managed: 
    - source: salt://projects/hugo/src/frontend/config.toml.template
    - name: /app/dev/projects/hugo/src/frontend/config.toml
    - template: jinja