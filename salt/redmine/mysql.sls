debconf-utils:
  pkg.installed

mysql_setup:
  debconf.set:
    - name: mysql-server
    - data:
        'mysql-server/root_password': {'type': 'password', 'value': '{{ salt['pillar.get']('mysql:root_pw', '') }}' }
        'mysql-server/root_password_again': {'type': 'password', 'value': '{{ salt['pillar.get']('mysql:root_pw', '') }}' }
    - require:
      - pkg: debconf-utils

mysql:
  mysql_database.present:
    - name: {{ salt['pillar.get']('mysql:app_user') }}
  mysql_user.present:
    - name: {{ salt['pillar.get']('mysql:app_user') }}
    - host: localhost
    - password: {{ salt['pillar.get']('mysql:app_pw') }}
    - connection_charset: utf8
    - saltenv:
      - LC_ALL: "en_US.utf8"

redmineDB_grant:
  mysql_grants.present:
    - grant: all privileges
    - database: {{ salt['pillar.get']('mysql:app_user') }}.*
    - user: {{ salt['pillar.get']('mysql:app_user') }}
    - host: localhost
