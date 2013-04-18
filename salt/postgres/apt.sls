include:
  - apt

extend:
  apt-update:
    cmd.run:
      - name: echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release --codename --short)-pgdg main" > /etc/apt/sources.list.d/pgdg.list; wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | apt-key add -
