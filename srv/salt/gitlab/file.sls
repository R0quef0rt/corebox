gitlab-config: 
  file.managed: 
    - template: jinja
    - source: salt://gitlab/files/gitlab.rb.template
    - name: /app/live/projects/gitlab/gitlab.rb

# gitlab-serialize-json: 
#   file.serialize: 
#     - template: jinja
#     - source: salt://gitlab/files/gitlab.rb.template
#     - name: /app/live/projects/gitlab/config/gitlab.rb