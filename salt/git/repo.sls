{% for repo in salt['pillar.get']('repository') %}
{{repo['name']}}-download:
  git.latest:
    - name: {{repo['name']}}
    - rev: {{repo['rev']}}
    - target: {{repo['target']}}
    - force_checkout: True
    - force_clone: True
    - force_fetch: True
    - force_reset: True
    - submodules: True
    - depth: 1
{% endfor %}