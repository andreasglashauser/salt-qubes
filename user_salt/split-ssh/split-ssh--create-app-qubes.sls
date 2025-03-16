{% if grains['id'] == 'dom0' %}

split-ssh--create-app-split-qube:
  qvm.vm:
    - name: app-split-ssh
    - present:
      - template: template-split-ssh
      - label: black
    - prefs:
      - label: black
      - audiovm: 
      - guivm: dom0
      - netvm:
      - template_for_dispvms: True
    - features:
      - set:
        - menu-items: debian-xterm.desktop
    - service:
      - enable:
        - shutdown-idle
    - require:
      - qvm: split-ssh--create-template
   

split-ssh--create-app-qube:
  qvm.vm:
    - name: app-ssh
    - present:
      - template: template-ssh
      - label: yellow
    - prefs:
      - label: yellow
      - audiovm: 
      - guivm: dom0
      - netvm:
      - template_for_dispvms: True
    - features:
      - set:
        - menu-items: debian-xterm.desktop
    - require:
      - qvm: ssh--create-template

{% endif %}
