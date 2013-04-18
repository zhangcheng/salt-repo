redis_ppa:
  pkgrepo.managed:
    - ppa: rwky/redis

redis-server:
  pkg.latest:
    - refresh: True
    - require:
      - pkgrepo: redis_ppa
  service.running:
    - enable: True
    - reload: True
    - require:
      - pkg: redis-server
      - sysctl: vm.overcommit_memory
      - file: /var/log/redis
    - watch:
      - file: /etc/redis/redis.conf

/var/log/redis:
  file.directory:
    - user: redis
    - group: adm
    - mode: 2750
    - require:
      - pkg: redis-server

/etc/redis/redis.conf:
  file.managed:
    - source: salt://redis/files/etc/redis/redis.conf.jinja
    - template: jinja
    - defaults:
      bind: 0.0.0.0
      port: 6379
      maxmemory: 0
      loglevel: notice
      databases: 1
    - require:
      - pkg: redis-server

vm.overcommit_memory:
  sysctl.present:
    - value: 1
    - config: /etc/sysctl.d/10-redis.conf
