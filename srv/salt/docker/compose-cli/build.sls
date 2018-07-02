{% for repo in pillar['compose:repos'].iteritems() %}
{{repo}}-download-latest:
  git.latest:
    - name: {{repo}}
    - rev: {{saltenv}}
    - target: /app/live
    - force_checkout: True
    - force_clone: True
    - force_fetch: True
    - force_reset: True
    - depth: 1
{% endfor %}

{% for project in pillar['compose:projects'].iteritems() %}
{{project}}-compose-build:
  cmd.run:
    - name: 'docker-compose -f /app/live/projects/{{project}}/docker-compose.yml build -d'
    - require:
      - pip: compose
      - git: compose-project

{{project}}-compose-push:
  cmd.run:
    - name: 'docker-compose -f /app/live/projects/{{project}}/docker-compose.yml push -d'
    - require:
      - pip: compose
      - git: compose-project
{% endfor %}