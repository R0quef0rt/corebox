test-ad-status:
  module.run:
    - name: dsc.test_config

install-rapididentity-schema:
  cmd.run:
    - name: cscript "C:\\app\\dev\\srv\\salt\\rapididentity\\files\\installSchema.js"
    - require: 
      - module: test-ad-status