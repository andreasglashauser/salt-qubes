{% if grains['id'] == 'dom0' %}

latex--create-app-qube:
  qvm.vm:
    - name: q-latex
    - present:
      - template: template-latex
      - label: yellow 
    - prefs:
      - label: yellow 
      - audiovm:
      - guivm: dom0
      - netvm:
    - features:
      - set:
        - menu-items: xterm.desktop
    - service:
      - enable:
        - shutdown-idle
    - require:
      - qvm: latex--create-template

{% endif %}
