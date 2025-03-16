{% if grains['id']== 'dom0' %}

sys-usb--configure-sys-qube:
  qvm.vm:
    - name: sys-usb
    - present:
      - template: app-usb
      - label: red
      - class: DispVM
    - prefs:
      - audiovm:
      - guivm:
      - netvm:
    - require:
      - sys-usb--create-app-qube

{% endif %}
