{% if grains['os'] == 'Debian' and 'whonix' not in grains['id'] %}

onionize-repositories--debian-repos:
  file.managed: 
    - name: /etc/apt/sources.list
    - source: salt://common/onionize-repositories/files/sources.list
    - user: root
    - group: root
    - mode: 600
    - require:
      - pkg: onionize-repositories--debian-install-packages

{% endif %}
