{% if grains['id'] == 'dom0' %}

dev-python--create-qube:
  qvm.vm:
    - name: q-dev-python
    - present:
      - template: template-dev-python
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
      - qvm: dev-python--create-template

{% endif %}
