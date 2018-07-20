filebeat-config: 
  file.managed: 
    - template: jinja
    - source: salt://filebeat/files/filebeat.tpl.yml
    - name: /app/live/projects/filebeat/filebeat.yml