haproxy:
  pkg:
    - installed
  service:
    - running
    - require:
      - pkg: haproxy
