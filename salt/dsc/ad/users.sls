test-dsc-ad-status:
  module.run:
    - name: dsc.test_config

manage-import-template: 
  file.managed: 
    - template: jinja
    - source: salt://dsc/ad/files/import.tpl.ps1
    - name: C:\\app\\import.ps1

import-users:
  cmd.run:
    - name: C:\\app\\import.ps1 
    - shell: powershell
    - require: 
      - file: manage-import-template
      - module: test-dsc-ad-status