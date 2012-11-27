etckeeper:
  pkg.installed

git:
  pkg.installed

/etc/etckeeper/etckeeper.conf:
  file:
    - managed
    - user: root
    - group: root
    - mode: 644
    - source: salt://etckeeper/etckeeper.conf

/tmp/etckeeper-init.sh:
  file:
    - managed
    - user: root
    - group: root
    - mode: 755
    - source: salt://etckeeper/etckeeper-init.sh

etckeeper-on-git-init:
  cmd.run:
    - name: /tmp/etckeeper-init.sh
    - require:
      - pkg: git
      - pkg: etckeeper
      - file: /etc/etckeeper/etckeeper.conf
      - file: /tmp/etckeeper-init.sh
