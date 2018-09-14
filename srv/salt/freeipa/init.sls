{% from 'docker/build.sls' import compose_build with context %}
{% from 'docker/up.sls' import compose_up with context %}
{% from 'system/firewall.sls' import add_port with context %}

{{ compose_build('freeipa') }}
{{ compose_up('freeipa') }}

url-freeipa:
  grains.list_present:
    - name: url-backend
    - value: freeipa, https://{{ grains['ip4_interfaces']['eth0'][0] }}/ipa/ui

{{ add_port('freeipa-http', '80', 'tcp') }}
{{ add_port('freeipa-https', '443', 'tcp') }}