{% if grains['id'] == 'dom0' %}

split-gpg-legacy--create-app-qube:
  qvm.vm:
    - name: app-split-gpg-legacy
    - present:
      - template: template-split-gpg-legacy
      - label: black
    - prefs:
      - label: black
      - audiovm:
      - guivm: dom0
      - netvm:
      - template_for_dispvms: True
    - service: 
      - enable:
        - shutdown-idle
    - require:
      - qvm: split-gpg-legacy--create-template

{% endif %}
