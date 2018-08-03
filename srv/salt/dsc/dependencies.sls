
{% for provider in salt['pillar.get']('win_dsc:dependencies:packageproviders', '') %}
install-dsc-provider-{{provider}}:
  cmd.run:
    - name: Get-PackageProvider -Name {{provider}} -ForceBootstrap
    - shell: powershell
  {% for module in salt['pillar.get']('win_dsc:dependencies:modules', 'xPendingReboot') %}
install-dsc-module-{{module}}:
  cmd.run:
    - name: Install-Module {{module}} -Force -Verbose 
    - shell: powershell
    - require: 
      - cmd: install-dsc-provider-{{provider}}
  {% endfor %}
{% endfor %}