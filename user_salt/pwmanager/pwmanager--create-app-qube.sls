{% if grains['id'] == 'dom0' %}

pwmanager--create-app-qube:
  qvm.vm:
    - name: q-pwmanager
    - present:
      - template: template-pwmanager
      - label: black
    - prefs:
      - label: black
      - template_for_dispvms: True
      - audiovm:
      - guivm: dom0
      - netvm:
    - features:
      - set:
        - menu-items: org.keepassxc.KeePassXC.desktop debian-xterm.desktop
    - require:
      - qvm: pwmanager--create-template

{% endif %}
