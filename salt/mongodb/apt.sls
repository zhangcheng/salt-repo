include:
  - apt

# our custom sources
/etc/apt/sources.list.d/10gen.list:
  file:
    - managed
    - source: salt://mongodb/ubuntu/apt/10gen.list
    - owner: root
    - group: root
    - mode: 644
    - template: jinja

extend:
  apt-update:
    cmd:
      - watch:
        - file: /etc/apt/sources.list.d/10gen.list


# and the key to go with it
{% for key in ['10gen',] %}
/etc/apt/{{ key }}.key:
  file:
    - managed
    - source: salt://mongodb/ubuntu/apt/{{ key }}.key
    - owner: root
    - group: root
    - mode: 644

apt-add-{{ key }}-key:
  cmd.run:
    - name: apt-key add /etc/apt/{{ key }}.key
    - require:
      - file: /etc/apt/{{ key }}.key

extend:
  apt-update:
    cmd:
      - watch:
        - cmd: apt-add-{{ key }}-key
{% endfor %}

# vim: set ft=yaml ts=2 sw=2 et sts=2 :
