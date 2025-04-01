{% if grains['id'] == 'dom0' %}

dev-cursor--create-qube:
  qvm.vm:
    - name: q-dev-cursor
    - present:
      - template: template-dev-cursor
      - label: orange
    - prefs:
      - label: orange
      - netvm: sys-vpn-mullvad
    - features:
      - set:
        - menu-items: cursor.desktop xterm.desktop
    - service:
      - enable:
        - shutdown-idle
    - require:
      - qvm: dev-cursor--create-template

{% endif %}
