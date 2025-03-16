{% if grains['id'] == 'dom0' %}

sys-audio--create-app-qube:
  qvm.vm:
    - name: app-audio
    - present:
      - template: template-audio
      - label: purple
    - prefs:
      - label: purple
      - audiovm: 
      - guivm: 
      - netvm: 
      - autostart: False
      - template_for_dispvms: True
    - features:
      - set:
        - menu-items: debian-xterm.desktop
    - require:
      - qvm: sys-audio--create-template

{% endif %}
