{% for name, zone in pillar.get('timezone', {}).items() %}
{{zone}}:
  timezone.system:
    - utc: True
{% endfor %}