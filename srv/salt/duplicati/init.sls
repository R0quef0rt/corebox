{% from 'docker/compose/build.sls' import compose_build with context %}
{% from 'docker/compose/up.sls' import compose_up with context %}
{% from 'system/users/macros.sls' import group, master_user, service_user with context %}
{% from 'system/firewall.sls' import add_port with context %}

{{ service_user('duplicati', '6005', 'media') }}

{{ compose_build('duplicati') }}
{{ compose_up('duplicati') }}

{{ add_port('duplicati', '8200', 'tcp') }}