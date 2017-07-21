mkdir:
  cmd.run:
    - name: mkdir -p {{ salt['pillar.get']('nginx:root_dir') }}/

https://svn.redmine.org/redmine/branches/{{ salt['pillar.get']('redmine:version') }}-stable:
  svn.export:
    - target: {{ salt['pillar.get']('nginx:root_dir') }}/
    - trust: True

{{ salt['pillar.get']('nginx:root_dir') }}/{{ salt['pillar.get']('redmine:version') }}-stable:
  file.rename:
    - name: {{ salt['pillar.get']('nginx:root_dir') }}/redmine
    - source: {{ salt['pillar.get']('nginx:root_dir') }}/{{ salt['pillar.get']('redmine:version') }}-stable
    - force: True

{{ salt['pillar.get']('nginx:config_dir') }}:
  file.copy:
    - name: {{ salt['pillar.get']('nginx:config_dir') }}/configuration.yml
    - source: {{ salt['pillar.get']('nginx:config_dir') }}/configuration.yml.example
    - force: True

{{ salt['pillar.get']('nginx:config_dir') }}/database.yml:
  file.managed:
    - source: {{ salt['pillar.get']('nginx:source') }}/database.yml
    - user: {{ salt['pillar.get']('nginx:root_user') }}
    - group: {{ salt['pillar.get']('nginx:root_user') }}
    - mode: 644

{{ salt['pillar.get']('nginx:root_dir') }}/redmine/public:
  file.directory:
    - name: {{ salt['pillar.get']('nginx:root_dir') }}/redmine/public/plugin_assets
    - force: True
    - user: {{ salt['pillar.get']('nginx:user') }}
    - group: {{ salt['pillar.get']('nginx:user') }}

{{ salt['pillar.get']('nginx:root_dir') }}/redmine/files:
  file.directory:
    - name: {{ salt['pillar.get']('nginx:root_dir') }}/redmine/files
    - force: True
    - user: {{ salt['pillar.get']('nginx:user') }}
    - group: {{ salt['pillar.get']('nginx:user') }}
    - mode: 775
    - recurse:
      - user
      - group

{{ salt['pillar.get']('nginx:root_dir') }}/redmine/tmp:
  file.directory:
    - user: {{ salt['pillar.get']('nginx:user') }}
    - group: {{ salt['pillar.get']('nginx:user') }}
    - mode: 775
    - recurse:
      - user
      - group

{{ salt['pillar.get']('nginx:root_dir') }}/redmine/log:
  file.directory:
    - user: {{ salt['pillar.get']('nginx:user') }}
    - group: {{ salt['pillar.get']('nginx:user') }}
    - mode: 775
    - recurse:
      - user
      - group

{{ salt['pillar.get']('nginx:root_dir') }}/redmine/public/plugin_assets:
  file.directory:
    - user: {{ salt['pillar.get']('nginx:user') }}
    - group: {{ salt['pillar.get']('nginx:user') }}
    - mode: 775
    - recurse:
      - user
      - group

{{ salt['pillar.get']('nginx:root_dir') }}/redmine/tmp/pdf:
  file.directory:
    - user: {{ salt['pillar.get']('nginx:user') }}
    - group: {{ salt['pillar.get']('nginx:user') }}
    - mode: 775
    - recurse:
      - user
      - group
