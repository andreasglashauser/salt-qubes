bash--limit-bash-history:
  file.managed:
    - name: /etc/profile.d/limit_bash_history.sh
    - contents: |
        #!/bin/bash
        export HISTSIZE=5
        export HISTFILESIZE=5
    - mode: 755
    - user: root
    - group: root
