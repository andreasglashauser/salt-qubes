{% if grains['id'] == 'dom0' %}

split-btc--create-app-offline-qube:
  qvm.vm:
    - name: app-btc-offline
    - present:
      - template: template-btc-offline
      - label: black
    - prefs:
      - label: black
      - audiovm:
      - guivm: dom0
      - netvm:
      - template_for_dispvms: True
    - features:
      - set:
        - menu-items: debian-xterm.desktop electrum.desktop
    - service:
      - enable:
        - shutdown-idle
    - require:
      - qvm: offline-btc--create-template

split-btc--create-app-qube:
  qvm.vm:
    - name: app-btc
    - present:
      - template: template-btc
      - label: red
    - prefs:
      - label: red
      - audiovm:
      - guivm: dom0
      - netvm: 
      - template_for_dispvms: True
    - features:
      - set:
        - menu-items: debian-xterm.desktop electrum.desktop
    - service:
      - enable:
        - shutdown-idle
    - require:
      - qvm: btc--create-template

{% endif %}
