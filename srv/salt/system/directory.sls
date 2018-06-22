/etc/nzbget:
  file.directory:
    - user: root
    - group: docker
    - mode: 755
    - makedirs: True
    - recurse:
      - user
      - group
      - mode