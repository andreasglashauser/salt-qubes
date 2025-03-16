{% if grains['id'] == 'dom0' %}

sys-firewall--configure-sys-qube:
  qvm.vm:
    - name: sys-firewall
    - present:
      - template: app-firewall
      - label: red
      - class: DispVM
    - prefs:
      - label: red
      - audiovm:
      - guivm:
      - netvm: sys-net
      - autostart: True
    - require:
      - qvm: sys-firewall--create-app-qube

{% endif %}
