{% if grains['id'] == 'dom0' %}

disk-trimming--configure-cron-trim:
  file.managed:
    - name: /etc/cron.hourly/trim
    - contents: |
        #!/bin/bash
        /sbin/fstrim --all
    - user: root
    - group: root
    - mode: 755

{% endif %}
