{% if grains['id'] == 'dom0' %}

default-mgmt-dvm--create-app-qube:
  qvm.vm:
    - name: default-mgmt-dvm
    - present:
      - template: template-default-mgmt-dvm
      - label: red
    - prefs:
      - label: red
      - audiovm:
      - guivm:
      - netvm: 
      - template_for_dispvms: True
    - require:
      - qvm: default-mgmt-dvm--create-template

{% endif %}
