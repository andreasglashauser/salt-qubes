{% if grains['id'] == 'dom0' %}

notes--create-app-qube:
  qvm.vm:
    - name: q-notes
    - present:
      - template: template-notes
      - label: black
    - prefs:
      - label: black
      - audiovm:
      - guivm: dom0
      - netvm: 
    - features:
      - set:
        - menu-items: debian-xterm.desktop
    - service:
      - enable:
        - shutdown-idle
    - require:
      - qvm: notes--create-template
 
{% endif %}
