bash--limit-bash-history:
  file.managed:
    - name: /etc/profile.d/limit_bash_history.sh
    - source: salt://common/bash/files/conf
    - mode: 755
    - user: root
    - group: root
