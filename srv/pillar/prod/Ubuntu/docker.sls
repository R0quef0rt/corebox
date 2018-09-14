docker:

  pkg:
    name: docker-ce
    version: latest
    allow_updates: False
    hold: False

  pip:
    pkgname: python-pip
    upgrade: True

  compose_version: