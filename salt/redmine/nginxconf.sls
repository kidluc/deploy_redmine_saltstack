/opt/nginx/conf/nginx.conf:
  file.managed:
    - source: salt://redmine/config/nginx.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - makedirs: True

mkdir:
  cmd.run:
    - name: mkdir -p /opt/nginx/conf/vhost

/opt/nginx/conf/vhost/redmine.conf:
  file.managed:
    - source: salt://redmine/config/redmine.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - makedirs: True
    - require:
      - mkdir

/lib/systemd/system/nginx.service:
  file.managed:
    - source: salt://redmine/config/nginx.service
    - user: root
    - group: root
    - mode: 644
