{% from 'docker/compose/build.sls' import compose_build with context %}
{% from 'docker/compose/up.sls' import compose_up with context %}
{% from 'system/firewall.sls' import add_port with context %}

{{ compose_build('freeipa') }}
{{ compose_up('freeipa') }}

url-freeipa:
  grains.list_present:
    - name: url-backend
    - value: freeipa, https://{{ grains['ipv4']|last }}/ipa/ui

{{ add_port('freeipa-http', '80', 'tcp') }}
{{ add_port('freeipa-https', '443', 'tcp') }}