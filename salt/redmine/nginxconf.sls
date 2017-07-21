{{ salt['pillar.get']('nginx:dir') }}/nginx.conf:
  file.managed:
    - source: {{ salt['pillar.get']('nginx:source') }}/nginx.conf
    - user: {{ salt['pillar.get']('nginx:root_user') }}
    - group: {{ salt['pillar.get']('nginx:root_user') }}
    - mode: 644
    - template: {{ salt['pillar.get']('nginx:template') }}
    - makedirs: True

mkdir:
  cmd.run:
    - name: mkdir -p {{ salt['pillar.get']('nginx:dir') }}/vhost

{{ salt['pillar.get']('nginx:dir') }}/vhost/redmine.conf:
  file.managed:
    - source: {{ salt['pillar.get']('nginx:source') }}/redmine.conf
    - user: {{ salt['pillar.get']('nginx:root_user') }}
    - group: {{ salt['pillar.get']('nginx:root_user') }}
    - mode: 644
    - template: {{ salt['pillar.get']('nginx:template') }}
    - makedirs: True
    - require:
      - mkdir

/lib/systemd/system/nginx.service:
  file.managed:
    - source: {{ salt['pillar.get']('nginx:source') }}/nginx.service
    - user: {{ salt['pillar.get']('nginx:root_user') }}
    - group: {{ salt['pillar.get']('nginx:root_user') }}
    - mode: 644
