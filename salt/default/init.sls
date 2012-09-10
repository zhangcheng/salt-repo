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
      - logrotate
      - realpath
      - sudo
      - tmux
    - require:
      - cmd: apt-upgrade
