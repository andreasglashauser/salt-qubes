{% if grains['id'] == 'dom0' %}

llm--create-qube:
  qvm.vm:
    - name: q-llm
    - present:
      - template: template-llm
      - label: orange
    - prefs:
      - label: orange
      - audiovm:
      - guivm: dom0
      - netvm: sys-vpn-mullvad
      - memory: 4000
      - maxmem: 8000
      - vcpus: 4
    - features:
      - set:
        - menu-items: xterm.desktop org.mozilla.firefox.desktop
    - service:
      - enable:
        - shutdown-idle
    - require:
      - qvm: llm--create-template

llm--extend-private-storage:
  cmd.run:
    - name: qvm-volume extend q-llm:private 10737418240

{% endif %}
