{% if grains['id'] != 'dom0' %}

remove-unwanted--systemd-service-networkd:
  service.masked:
    - name: systemd-networkd.service

remove-unwanted--systemd-service-networkd-socket:
  service.masked:
    - name: systemd-networkd.socket

remove-unwanted--systemd-service-networkd-online:
  service.masked:
    - name: systemd-networkd-wait-online.service

{% endif %}
