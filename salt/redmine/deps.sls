redmine_deps:
  pkg.installed:
    - pkgs:
      - libmysqlclient-dev
      - imagemagick
      - libmagickwand-dev
      - libcurl4-openssl-dev
      - git-core
      - subversion
      - git
      - libssl-dev
      - ruby-dev
      - curl

base:
  pkgrepo.managed:
    - name: deb http://archive.ubuntu.com/ubuntu trusty universe
    - refresh: True

mysql:
  pkg.installed:
    - pkgs:
      - mysql-server-5.6
      - mysql-client-5.6
    - require:
      - base
