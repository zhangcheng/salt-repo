haproxy:
  pkg:
    - installed
  service:
    - running
    - require:
      - pkg: haproxy

/etc/haproxy/haproxy.cfg.example:
  file:
    - managed
    - user: root
    - group: root
    - mode: 644
    - source: salt://haproxy/conf/haproxy.cfg.example
    - require:
      - pkg: haproxy
