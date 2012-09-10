include:
  - apt

default:
  pkg:
    - latest
    - names:
      - aptitude
      - etckeeper
      - git-core
      - htop
      - linux-headers-virtual
      - linux-image-virtual
      - linux-virtual
      - logrotate
      - realpath
      - sudo
      - tmux
    - require:
      - cmd: apt-upgrade

default-removed:
  pkg:
    - removed
    - names:
      - linux-headers-server
      - linux-image-server
      - linux-server
      - memtest86+
      - ubuntu-standard
    - require:
      - cmd: apt-upgrade
