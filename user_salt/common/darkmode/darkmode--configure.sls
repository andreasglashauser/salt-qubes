darkmode--configure-profile:
  file.managed:
    - name: /etc/profile.d/darkmode.sh
    - source: salt://common/darkmode/files/darkmode.sh
    - user: root
    - group: root
    - mode: 755

darkmode--configure-environment:
  file.append:
    - name: /etc/environment
    - source: salt://common/darkmode/files/environment
