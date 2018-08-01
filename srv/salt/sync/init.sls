{% from 'docker/compose/build.sls' import compose_build with context %}
{{ compose_build('sync') }}
{% from 'docker/compose/up.sls' import compose_up with context %}
{{ compose_up('sync') }}

{% from 'system/users/macros.sls' import group, master_user, service_user with context %}
{{ service_user('sync', '6004', 'media') }}