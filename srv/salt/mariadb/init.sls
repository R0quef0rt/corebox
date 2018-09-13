{% from 'docker/compose/up.sls' import compose_up with context %}
{% from 'system/firewall.sls' import add_port with context %}

{{ compose_up('mariadb') }}

{{ add_port('mariadb-server', '3306', 'tcp') }}