set-lcm-config:
  module.run:
    - name: dsc.set_lcm_config
    - config_mode: ApplyAndAutoCorrect
    - config_mode_freq: 15
    - refresh_mode: Push
    - refresh_freq: 30
    - reboot_if_needed: True
    - action_after_reboot: ContinueConfiguration
    - require:
      - sls: dsc.dependencies