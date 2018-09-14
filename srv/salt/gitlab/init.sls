{% from 'docker/build.sls' import compose_build with context %}
{% from 'docker/up.sls' import compose_up with context %}
{% from 'system/firewall.sls' import add_port with context %}

{{ compose_build('gitlab') }}
{{ compose_up('gitlab') }}

url-gitlab:
  grains.list_present:
    - name: url-backend
    - value: gitlab, http://{{ grains['ip4_interfaces']['eth0'][0] }}/gitlab

{{ add_port('gitlab-container-registry', '5000', 'tcp') }}