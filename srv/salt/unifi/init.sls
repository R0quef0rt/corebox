{% from 'docker/build.sls' import compose_build with context %}
{% from 'docker/up.sls' import compose_up with context %}
{% from 'system/firewall.sls' import add_port with context %}

{{ compose_build('unifi') }}
{{ compose_up('unifi') }}

url-unifi:
  grains.list_present:
    - name: url-backend
    - value: unifi, https://{{ grains['ip4_interfaces']['eth0'][0] }}:8443

{{ add_port('unifi-device', '8080', 'tcp') }}
{{ add_port('unifi-web', '8443', 'tcp') }}
{{ add_port('unifi-stun', '3478', 'udp') }}
{{ add_port('unifi-discovery', '10001', 'udp') }}