mkdir:
  cmd.run:
    - name: mkdir -p /var/www/

https://svn.redmine.org/redmine/branches/3.2-stable:
  svn.export:
    - target: /var/www/
    - trust: True

/var/www/3.2-stable:
  file.rename:
    - name: /var/www/redmine
    - source: /var/www/3.2-stable
    - force: True

/var/www/redmine/config:
  file.copy:
    - name: /var/www/redmine/config/configuration.yml
    - source: /var/www/redmine/config/configuration.yml.example
    - force: True

/var/www/redmine/config/database.yml:
  file.managed:
    - source: salt://redmine/config/database.yml
    - user: root
    - group: root
    - mode: 644

#/var/www/redmine/tmp:
#  file.directory:
#    - name: /var/www/redmine/tmp/pdf
#    - force: True

/var/www/redmine/public:
  file.directory:
    - name: /var/www/redmine/public/plugin_assets
    - force: True

/var/www/redmine/files:
  file.directory:
    - name: /var/www/redmine/tmp/pdf
    - force: True
    - user: www-data
    - group: www-data
    - mode: 775
    - recurse:
      - user
      - group

/var/www/redmine/tmp:
  file.directory:
    - user: www-data
    - group: www-data
    - mode: 775
    - recurse:
      - user
      - group

/var/www/redmine/log:
  file.directory:
    - user: www-data
    - group: www-data
    - mode: 775
    - recurse:
      - user
      - group

/var/www/redmine/public/plugin_assets:
  file.directory:
    - user: www-data
    - group: www-data
    - mode: 775
    - recurse:
      - user
      - group
