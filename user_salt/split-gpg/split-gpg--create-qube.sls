{% if grains['id'] == 'dom0' %}

split-gpg--create-split-gpg-qube:
  qvm.vm:
    - name: q-split-gpg
    - present:
      - template: app-split-gpg
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
    - require:
      - qvm: split-gpg--create-app-qube

{% endif %}
