default-dashboard:
  grafana4_dashboard.present:
    - name: Default
    - profile: grafana_auth
    - base_dashboards_from_pillar:
      - default_dashboard
    - base_rows_from_pillar:
      - default_row
    - base_panels_from_pillar:
      - default_panel
    - dashboard:
        rows:
          - title: Usage
            panels:
              - targets:
                  - target: alias(constantLine(50), 'max')
                title: Imaginary
                type: graph