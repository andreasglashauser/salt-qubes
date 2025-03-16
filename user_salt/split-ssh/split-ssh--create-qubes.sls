{% if grains['id'] == 'dom0' %}

q-split-ssh--create-sys-qube:
  qvm.vm:
    - name: q-split-ssh
    - present:
      - template: app-split-ssh
      - label: black
      - class: DispVM
    - prefs:
      - label: black
      - audiovm:
      - guivm: dom0
      - netvm: 
    - service:
      - enable:
        - shutdown-idle
        - split-gpg2-client
    - require:
      - qvm: split-ssh--create-app-split-qube

q-ssh--create-sys-qube:
  qvm.vm:
    - name: q-ssh
    - present:
      - template: app-ssh
      - label: yellow
      - class: DispVM
    - prefs:
      - label: yellow
      - audiovm:
      - guivm: dom0
      - netvm: sys-vpn-mullvad
    - require:
      - qvm: split-ssh--create-app-qube

{% endif %}
