include:
  - apt

default:
  pkg:
    - latest
    - names:
      - aptitude
      - build-essential
      - etckeeper
      - git
      - htop
      - linux-headers-virtual
      - linux-image-virtual
      - linux-virtual
      - logrotate
      - realpath
      - salt-minion
      - sudo
      - tmux
    - require:
      - cmd: apt-upgrade

default-removed:
  pkg:
    - removed
    - names:
      - git-core
      - linux-headers-server
      - linux-image-server
      - linux-headers-generic
      - linux-image-generic
      - linux-server
      - memtest86+
      - ubuntu-standard
    - require:
      - cmd: apt-upgrade
