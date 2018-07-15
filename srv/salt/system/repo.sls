{% for repo in salt['pillar.get']('repos', 'https://github.com/R0quef0rt/devbox') %}
{{repo}}-download-latest:
  git.latest:
    - name: {{repo}}
    - rev: master
    - target: /app/live
    - force_checkout: True
    - force_clone: True
    - force_fetch: True
    - force_reset: True
    - depth: 1
{% endfor %}