gem:
  cmd.run:
    - name: gem install passenger --no-ri --no-rdoc

passenger-install:
  cmd.wait:
    - name: passenger-install-nginx-module
    - watch:
      - gem
