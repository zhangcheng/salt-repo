packages:
    pkg.installed:
        - names:
            - python-dev
            - python-virtualenv
            - postgresql-server-dev-9.2
            - libgeoip-dev
            - libxml2-dev
            - libxslt1-dev

/home/vagrant/venv:
    virtualenv.managed:
        - no_site_packages: True
        - runas: vagrant
        - distribute: True
        - requirements: /vagrant/requirements.txt
        - require:
            - pkg: python-dev
            - pkg: python-virtualenv
            - pkg: postgresql-server-dev-9.2
            - pkg: libgeoip-dev
            - pkg: libxml2-dev
            - pkg: libxslt1-dev
