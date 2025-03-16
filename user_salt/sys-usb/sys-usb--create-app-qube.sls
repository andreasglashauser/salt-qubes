{% if grains['id'] == 'dom0' %}

sys-usb--create-app-qube:
  qvm.vm:
    - name: app-usb
    - present:
      - template: template-usb
      - label: red
    - prefs:
      - label: red
      - audiovm:
      - guivm:
      - netvm:
      - autostart: False
      - template_for_dispvms: True
    - require:
      - qvm: sys-usb--create-template

{% endif %}
