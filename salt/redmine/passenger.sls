gem:
  cmd.run:
    - name: gem install passenger --no-ri --no-rdoc

passenger-install:
  cmd.run:
    - name: passenger-install-nginx-module
