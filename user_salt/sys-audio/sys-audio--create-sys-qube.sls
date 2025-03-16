{% if grains['id'] == 'dom0' %}

sys-audio--create-sys-qube:
  qvm.vm:
    - name: sys-audio
    - present:
      - template: app-audio
      - label: purple
      - class: DispVM
    - prefs:
      - label: purple
      - autostart: True
      - provides-network: True
      - virt_mode: hvm
      - maxmem: 0
      - audiovm: 
      - guivm: dom0
      - netvm: 
    - service:
      - enable:
        - audiovm
    - require:
      - qvm: sys-audio--create-app-qube

{% endif %}
