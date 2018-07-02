dev:
  '*':
    - srv.salt
    - srv.pillar
qa:
  '*':
    - srv.salt
    - srv.pillar
prod:
  '*':
    - srv.salt
    - srv.pillar