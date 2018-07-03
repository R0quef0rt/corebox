/app/dev/projects/hugo/config.toml: 
  file.managed: 
    - user: root 
    - group: root 
    - mode: 0644 
    - source: salt://projects/hugo/frontend/config.toml.template
    - template: jinja