{%- from "virtualbox/map.jinja" import host with context %}
{%- if host.enabled %}

{%- if grains.os_family == 'Debian' %}

virtualbox_repo:
  pkgrepo.managed:
  - human_name: virtualbox
  - name: deb http://download.virtualbox.org/virtualbox/debian {{ grains.oscodename }} contrib
  - file: /etc/apt/sources.list.d/virtualbox.list
  - key_url: http://download.virtualbox.org/virtualbox/debian/oracle_vbox_2016.asc

virtualbox_packages:
  pkg.installed:
  - names:
    - build-essential
    - dkms
    - linux-headers-{{ grains.kernelrelease }}
    - virtualbox-dkms
    - virtualbox-{{ host.version }}
  - require:
    - pkgrepo: virtualbox_repo

virtualbox_setup_kernel_drivers:
  cmd.wait:
  - name: /sbin/vboxconfig
  - cwd: /root
  - watch:
    - pkg: virtualbox_packages

{%- elif grains.os_family == "RedHat" %}

{# TODO #}

{%- elif grains.os_family == "Windows" %}

virtualbox_install_package:
  pkg.installed:
  - name: virtualbox_x64_en

{%- endif %}
{%- endif %}