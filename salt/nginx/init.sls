nginx-pkgs:
  pkg:
    - latest
    - names:
      - nginx-full

/etc/nginx/nginx.conf:
  file:
    - managed
    - source: salt://nginx/conf/nginx.conf
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: nginx-pkgs

nginx:
  service:
    - running
    - enable: True
    - watch:
      - file: /etc/nginx/nginx.conf
