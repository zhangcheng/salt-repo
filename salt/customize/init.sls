include:
  - default.clean
  - kernel
  - locales

/usr/local/sbin/etc-issue.sh:
  file:
    - managed
    - user: root
    - group: root
    - mode: 755
    - source: salt://customize/files/etc-issue.sh

/etc/rc.local:
  file.patch:
    - source: salt://customize/files/0001-update-etc-issue-for-every-boot.patch
    - dry_run_first: True
    - hash: md5=e127f57b30316af349a44ba08c48f19d
    - require:
      - file: /usr/local/sbin/etc-issue.sh
