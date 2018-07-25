# gitlab-secrets: 
#   file.managed: 
#     - template: jinja
#     - source: salt://gitlab/files/secrets.txt.template
#     - name: /app/live/projects/gitlab/secrets.txt

# gitlab-serialize-json: 
#   file.serialize: 
#     - template: jinja
#     - source: salt://gitlab/files/gitlab.rb.template
#     - name: /app/live/projects/gitlab/config/gitlab.rb