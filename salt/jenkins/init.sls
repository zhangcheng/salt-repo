include:
  - nginx

jenkins:
  cmd.run:
    - name: wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
    - unless: apt-key list | grep 'Kohsuke Kawaguchi'
    - require:
      - file: /etc/apt/sources.list.d/jenkins.list
  service.running:
    - require:
      - pkg: nginx-pkgs
      - pkg: jenkins-pkgs
      - cmd: apt-update

jenkins-pkgs:
  pkg.installed:
    - name: git
    - name: jenkins
    - name: zip

apt-update:
  cmd:
    - run
    - name: apt-get update

/etc/apt/sources.list.d/jenkins.list:
  file.managed:
    - source: salt://jenkins/files/conf/jenkins.list
