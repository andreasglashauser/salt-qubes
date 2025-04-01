{% if grains['id'] == 'dom0' %}

dev-website--create-qube:
  qvm.vm:
    - name: q-dev-website
    - present:
      - template: template-dev-website
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
      - qvm: dev-website--create-template

{% endif %}
