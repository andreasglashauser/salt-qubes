{% if grains['id'] == 'dom0' %}

split-gpg-legacy--create-split-gpg-qube:
  qvm.vm:
    - name: q-split-gpg-legacy
    - present:
      - template: app-split-gpg-legacy
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
      - qvm: split-gpg-legacy--create-app-qube

{% endif %}
