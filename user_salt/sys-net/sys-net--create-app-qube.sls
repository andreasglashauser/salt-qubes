{% if grains['id'] == 'dom0' %}

sys-net--create-app-qube:
  qvm.vm:
    - name: app-net
    - present:
      - template: template-net
      - label: red
    - prefs:
      - label: red 
      - guivm:
      - audiovm:
      - netvm:
      - autostart: False
      - template_for_dispvms: True
    - require:
      - sys-net--create-template

{% endif %}
