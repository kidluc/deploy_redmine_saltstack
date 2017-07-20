mysql:
  root_pw: 'root'
  app_user: 'redmine'
  app_pw: 'redmine'

redmine:
  rootdir: '/var/www/redmine'
  rbenv_dir: '/usr/local/rbenv'
  logdir: '/var/log/nginx'
  rubyversion: '2.2.5'
  version: '3.2'
  user: 'redmine'
  tls:
    common_name: {{grains['fqdn']}}
