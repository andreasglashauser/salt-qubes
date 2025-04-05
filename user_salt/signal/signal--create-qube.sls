{% if grains['id'] == 'dom0' %}

signal--create-app-qube:
  qvm.vm:
    - name: q-signal
    - present:
      - template: template-signal
      - label: yellow
    - prefs:
      - label: yellow
      - audiovm: sys-audio
      - guivm: dom0
      - netvm: sys-vpn-mullvad
    - features:
      - set:
        - menu-items: signal-desktop.desktop
    - require:
      - qvm: signal--create-template

{% endif %}
