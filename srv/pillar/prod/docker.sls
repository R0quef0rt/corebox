docker:

  pkg:
    name: docker-ce
    version: latest
    allow_updates: False
    hold: False

  pip:
    pkgname: python2-pip
    upgrade: True

  compose_version: