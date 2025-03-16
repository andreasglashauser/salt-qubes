journald--configure:
  file.managed:
    - name: /etc/systemd/journald.conf
    - source: salt://common/journald/files/journald.conf
