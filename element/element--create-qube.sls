{% if grains['id'] == 'dom0' %}

element--create-qube:
  qvm.vm:
    - name: q-element
    - present:
      - template: template-element
      - label: yellow
    - prefs:
      - label: yellow
      - audiovm: sys-audio
      - guivm: dom0
      - netvm: sys-vpn-mullvad
    - features:
      - set:
        - menu-items: element-desktop.desktop
    - require:
      - qvm: element--create-template

{% endif %}
