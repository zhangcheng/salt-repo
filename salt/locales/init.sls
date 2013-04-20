/var/lib/locales/supported.d/en:
  file:
    - managed
    - user: root
    - group: root
    - mode: 644
    - source: salt://locales/supported.d/en

/var/lib/locales/supported.d/local:
  file:
    - managed
    - user: root
    - group: root
    - mode: 644
    - source: salt://locales/supported.d/local

locale-gen --purge:
  cmd.run:
    - require:
      - file: /var/lib/locales/supported.d/local
      - file: /var/lib/locales/supported.d/en
