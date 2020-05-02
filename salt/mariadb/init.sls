{% from 'docker/build.sls' import compose_build with context %}
{% from 'docker/up.sls' import compose_up with context %}
{% from 'system/firewall.sls' import add_port with context %}

{{ compose_build('mariadb') }}
{{ compose_up('mariadb') }}

{{ add_port('mariadb-server', '3306', 'tcp') }}