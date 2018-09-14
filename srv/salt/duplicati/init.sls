{% from 'docker/build.sls' import compose_build with context %}
{% from 'docker/up.sls' import compose_up with context %}
{% from 'system/firewall.sls' import add_port with context %}

{{ compose_build('duplicati') }}
{{ compose_up('duplicati') }}

url-duplicati:
  grains.list_present:
    - name: url-backend
    - value: duplicati, http://{{ grains['ip4_interfaces']['eth0'][0] }}:8200

{{ add_port('duplicati', '8200', 'tcp') }}