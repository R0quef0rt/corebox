{% from 'docker/compose/build.sls' import compose_build with context %}
{{ compose_build('sync') }}
{% from 'docker/compose/up.sls' import compose_up with context %}
{{ compose_up('sync') }}