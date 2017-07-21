{% set vars = pillar['redmine']%}

rbenv:
  pkg.latest:
    - refresh: True

rbenv-deps:
  pkg.installed:
    - pkgs:
      - bash
      - git
      - openssl
      - libssl-dev
      - make
      - curl
      - autoconf
      - bison
      - build-essential
      - libssl-dev
      - libyaml-dev
      - libreadline6-dev
      - zlib1g-dev
      - libncurses5-dev

bundler:
  gem.installed

bundle-install-gems:
  cmd.run:
    - name: rbenv exec bundle install --without development test
    - cwd: {{ vars['rootdir'] }}
    - env:
      - RBENV_ROOT: {{ salt['pillar.get']('redmine:rbenv_dir') }}

bundle-generate-secret:
  cmd.run:
    - name: rbenv exec rake generate_secret_token && echo 1 > {{vars['rootdir']}}/secret.txt
    - unless: grep 1 {{vars['rootdir']}}/secret.txt
    - cwd: {{ vars['rootdir'] }}
    - env:
      - RBENV_ROOT: {{ salt['pillar.get']('redmine:rbenv_dir') }}
    - require:
      - cmd: bundle-install-gems

bundle-db-init-schema:
  cmd.run:
    - name: rbenv exec rake db:migrate && echo 1 > {{vars['rootdir']}}/db-schema.txt
    - unless: grep 1 {{vars['rootdir']}}/db-schema.txt
    - cwd: {{ vars['rootdir'] }}
    - env:
      - RBENV_ROOT: {{ salt['pillar.get']('redmine:rbenv_dir') }}
      - RAILS_ENV: production
    - require:
      - cmd: bundle-install-gems
      - cmd: bundle-generate-secret

bundle-db-init-data:
  cmd.run:
    - name: echo "" | rbenv exec rake redmine:load_default_data && echo 1 > {{vars['rootdir']}}/db-data.txt
    - unless: grep 1 {{vars['rootdir']}}/db-data.txt
    - cwd: {{ vars['rootdir'] }}
    - env:
      - RBENV_ROOT: {{ salt['pillar.get']('redmine:rbenv_dir') }}
      - RAILS_ENV: production
    - require:
      - cmd: bundle-install-gems
      - cmd: bundle-generate-secret
      - cmd: bundle-db-init-schema

systemctl:
  cmd.run:
    - name: systemctl restart nginx
    - require:
      - bundle-generate-secret
      - bundle-db-init-schema
      - bundle-db-init-data
