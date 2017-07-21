nginx:
  root_user: 'root'
  template: 'jinja'
  root_dir: '/var/www'
  dir: '/opt/nginx/conf'
  config_dir: '/var/www/redmine/config'
  source: 'salt://redmine/config'
  user: 'www-data'

mysql:
  root_pw: 'root'
  app_user: 'redmine'
  app_pw: 'redmine'

redmine:
  rootdir: '/var/www/redmine'
  rbenv_dir: '/usr/local/rbenv'
  logdir: '/var/log/nginx'
  rubyversion: '2.3.3'
  version: '3.2'
  user: 'passenger'
  tls:
    common_name: {{grains['fqdn']}}
