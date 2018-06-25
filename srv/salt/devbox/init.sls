docker-compose:
  file.managed:
    - name: /app/docker-compose.yml
    - source: salt://docker-compose.yml
    - template: jinja
    - mode: 644
    - user: master