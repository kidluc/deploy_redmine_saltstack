daemon-reload:
  cmd.run:
    - name: systemctl daemon-reload

nginx-start:
  cmd.run:
    - name: systemctl start nginx
    - require:
      - daemon-reload
