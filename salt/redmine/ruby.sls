gpg:
  cmd.run:
    - name: gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3

curl:
  cmd.run:
    - name: curl -sSL https://raw.githubusercontent.com/wayneeseguin/rvm/stable/binscripts/rvm-installer | sudo bash -s stable

command:
  cmd.run:
    - name: 
      - source /usr/local/rvm/scripts/rvm
      - echo '[[ -s "/usr/local/rvm/scripts/rvm" ]] && source "/usr/local/rvm/scripts/rvm"' >> ~/.bashrc
