{% if grains['id'] == 'dom0' %}

/etc/logrotate.d/force_hourly_log_cleanup:
  file.managed:
    - contents: |
        /var/log/*log /var/log/**/*log {
                hourly
                missingok
                rotate 1
                size 1k
                copytruncate
                create 0644 root root
        }
    - mode: 755
    - user: root
    - group: root

{% endif %}
