tls.create_self_signed_cert:
  module.run:
    - cacert_path: /app/live/projects/gitlab
    - tls_dir: tls
    - CN: {{ grains['fqdn'] }}
    - C: US
    - ST: Texas
    - L: Houston
    - O: Autom8te.org
    - OU: DevOps
    - bits: 4096
    - digest: sha256
    - replace: false

/app/live/projects/gitlab/config/trusted-certs/{{ grains['fqdn'] }}.pem:
  file.managed:
    - source: /app/live/projects/gitlab/tls/certs/{{ grains['fqdn'] }}.crt

/app/live/projects/gitlab/config/trusted-certs/{{ grains['fqdn'] }}.key:
  file.managed:
    - source: /app/live/projects/gitlab/tls/certs/{{ grains['fqdn'] }}.key