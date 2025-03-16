{% if grains['id'] == 'dom0' %}

dev--create-app-qube:
  qvm.vm:
    - name: q-dev
    - present:
      - template: template-dev
      - label: orange
    - prefs:
      - label: orange
      - netvm: sys-vpn-mullvad
    - features:
      - set:
        - menu-items: xterm.desktop
    - service:
      - enable:
        - shutdown-idle
    - require:
      - qvm: dev--create-template

{% endif %}
