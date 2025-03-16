{% if grains['id'] == 'dom0' %}

disk-trimming--configure-cron-trim:
  file.managed:
    - name: /etc/cron.hourly/trim
    - source: salt://common/disk-trimming/files/trim-script
    - user: root
    - group: root
    - mode: 755

{% endif %}
