repository:
  - name: https://github.com/R0quef0rt/corebox
    rev: dev
    target: /app

directory:
  - name: mount
    path: /mnt
    user: media
    group: media
    mode: 650
    recurse: true