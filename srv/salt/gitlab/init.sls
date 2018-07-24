gitlab-config: 
  file.managed: 
    - template: jinja
    - source: salt://gitlab/files/gitlab.rb.template
    - name: /app/live/projects/gitlab/config/gitlab.rb