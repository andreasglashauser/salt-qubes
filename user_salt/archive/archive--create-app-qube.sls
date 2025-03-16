{% if grains['id'] == 'dom0' %}

include: 
  - archive.archive--create-template

archive--create-app-qube:
  qvm.vm:
    - name: q-archive
    - present:
      - template: template-archive
      - label: black
    - prefs:
      - label: black
      - guivm: dom0
      - audiovm: 
      - netvm: 
    - features:
      - set:
        - menu-items: debian-xterm.desktop
    - service:
      - enable:
        - shutdown-idle
    - require:
      - qvm: archive--create-template

{% endif %}
