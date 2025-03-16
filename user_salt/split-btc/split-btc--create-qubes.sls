{% if grains['id'] == 'dom0' %}

split-btc--create-split-offline-qube:
  qvm.vm:
    - name: q-btc-offline
    - present:
      - template: app-btc-offline
      - label: black
      - class: DispVM
    - prefs:
      - label: black
      - netvm: 
      - audiovm:
      - guivm: dom0
    - service:
      - enable:
        - shutdown-idle
    - require:
      - qvm: split-btc--create-app-offline-qube

split-btc--create-btc-qube:
  qvm.vm:
    - name: q-btc
    - present:
      - template: app-btc
      - label: red
      - class: DispVM
    - prefs:
      - label: red
      - audiovm:
      - guivm: dom0
      - netvm: sys-vpn-mullvad
    - service:
      - enable:
        - shutdown-idle
    - require:
      - qvm: split-btc--create-app-qube

{% endif %}
