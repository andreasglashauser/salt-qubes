{% if grains['os'] == 'Debian' and 'whonix' not in grains['id'] %}

onionize-repositories--debian-qubes-repo:
  file.managed: 
    - name: /etc/apt/sources.list.d/qubes-r4.list
    - source: salt://common/onionize-repositories/files/qubes-r4.list
    - user: root
    - group: root
    - mode: 600
    - require:
      - pkg: onionize-repositories--debian-install-packages

{% endif %}
