/etc/nzbget:
  file.directory:
    - user: vagrant
    - group: docker
    - mode: 777
    - makedirs: True
    - recurse:
      - user
      - group
      - mode