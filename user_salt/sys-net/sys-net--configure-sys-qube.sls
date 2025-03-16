{% if grains['id']== 'dom0' %}

sys-net--configure-sys-qube:
  qvm.vm:
    - name: sys-net
    - present:
      - template: app-net
      - label: red
      - class: DispVM
    - prefs:
      - audiovm:
      - guivm:
      - netvm:
    - require:
      - sys-net--create-app-qube

{% endif %}
