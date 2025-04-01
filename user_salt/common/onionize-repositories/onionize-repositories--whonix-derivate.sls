{% if 'whonix' in grains['id'] and not 'dvm' in grains['id'] %}

onionize-repositories--whonix-derivative:
  file.managed:
    - name: /etc/apt/sources.list.d/derivative.list
    - source: salt://common/onionize-repositories/files/derivative.list
    - user: root
    - group: root
    - mode: 644

{% endif %}
