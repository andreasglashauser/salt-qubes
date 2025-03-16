{% if grains['id'] == 'dom0' %}

split-gpg--create-app-qube:
  qvm.vm:
    - name: app-split-gpg
    - present:
      - template: template-split-gpg
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
      - qvm: split-gpg--create-template

{% endif %}
