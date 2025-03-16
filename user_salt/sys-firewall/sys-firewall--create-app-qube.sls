{% if grains['id'] == 'dom0' %}

sys-firewall--create-app-qube:
  qvm.vm:
    - name: app-firewall
    - present:
      - template: template-firewall
      - label: red
    - prefs:
      - label: red
      - audiovm:
      - guivm:
      - netvm:
      - autostart: False
      - template_for_dispvms: True
    - require:
      - qvm: sys-firewall--create-template

{% endif %}
