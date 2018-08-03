generate-template: 
  file.managed: 
    - template: jinja
    - source: salt://dsc/ad/files/main.tpl.ps1
    - name: C:\\app\\main.ps1

run-dsc-config:
  module.run:
    - name: dsc.run_config
    - path: C:\\app\\main.ps1
    - config_name: BuildADDC
    - config_data: ConfigData
    - salt_env: {{saltenv}}
    - require: 
      - file: C:\\app\\main.ps1