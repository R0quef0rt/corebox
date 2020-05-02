{% macro set_url(project,position,prefix,suffix) %}
  {% set interfaces = salt['grains.get']('ip4_interfaces') %}
  {% set primary = salt['grains.get']('network:interfaces:primary') %}

{{project}}-{{position}}-url:
  grains.list_present:
    - name: url-{{position}}
    - value: {{project}}, {{prefix}}://{{ interfaces.get(primary)[0] | yaml }}{{suffix}}

{% endmacro %}