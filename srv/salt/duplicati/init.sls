{% from 'docker/compose/build.sls' import compose_build with context %}
{{ compose_build('duplicati') }}
{% from 'docker/compose/up.sls' import compose_up with context %}
{{ compose_up('duplicati') }}

{% from 'system/users/macros.sls' import group, master_user, service_user with context %}
{{ service_user('duplicati', '6005', 'media') }}