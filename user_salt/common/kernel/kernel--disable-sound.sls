{% if grains['id'] != 'dom0' %}

/etc/modprobe.d/blacklist.conf:
  file.append:
    - source: salt://common/kernel/files/sound-modules

{% endif %}
