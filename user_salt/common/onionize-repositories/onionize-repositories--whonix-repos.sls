{% if 'whonix' in grains['id'] %}

onionize-repositories--whonix-repos:
  file.managed: 
    - name: /etc/apt/sources.list.d/debian.list
    - source: salt://common/onionize-repositories/files/debian-sources.list
    - user: root
    - group: root
    - mode: 600

{% endif %}
