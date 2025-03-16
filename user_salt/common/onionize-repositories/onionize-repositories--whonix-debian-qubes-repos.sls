{% if 'whonix' in grains['id'] %}

onionize-repositories--whonix-debian-qubes-repo:
  file.managed: 
    - name: /etc/apt/sources.list.d/qubes-r4.list
    - source: salt://common/onionize-repositories/files/qubes-r4.list
    - user: root
    - group: root
    - mode: 600

{% endif %}
