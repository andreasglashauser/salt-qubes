{% if grains['id'] == 'dom0' %}

default-dvm--app-qube-prefs:
  qvm.prefs:
    - name: default-dvm
    - label: red
    - audiovm:
    - guivm: dom0
    - netvm:
    - require:
      - qvm: default-dvm--create-template

{% endif %}
