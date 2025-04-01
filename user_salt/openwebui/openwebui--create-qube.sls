{% if grains['id'] == 'dom0' %}

openwebui--create-qube:
  qvm.vm:
    - name: q-openwebui
    - present:
      - template: template-openwebui
      - label: orange
    - prefs:
      - label: orange
      - autostart: True 
      - audiovm:
      - guivm: dom0
      - netvm: sys-vpn-mullvad
      - memory: 4000
      - maxmem: 6000
      - vcpus: 4
    - features:
      - set:
        - menu-items: xterm.desktop org.mozilla.firefox.desktop
    - service:
      - enable:
        - shutdown-idle
    - require:
      - qvm: openwebui--create-template

openwebui--extend-private-storage:
  cmd.run:
    - name: qvm-volume extend q-openwebui:private 10737418240

{% endif %}
