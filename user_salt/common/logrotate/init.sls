{% if grains['id'] == 'dom0' %}

/etc/logrotate.d/force_hourly_log_cleanup:
  file.managed:
    - source: salt://common/logrotate/files/force_hourly_log_cleanup
    - mode: 755
    - user: root
    - group: root

{% endif %}
