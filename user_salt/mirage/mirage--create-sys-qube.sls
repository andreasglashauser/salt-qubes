{% if grains['id'] == 'dom0' %}

mirage--create-sys-qube:
  qvm.vm:
    - name: sys-mirage-firewall
    - present:
      - class. StandaloneVM
      - label: black
    - prefs:
      - kernel: mirage-firewall
      - kernelopts: 
      - include-in-backups: False
      - memory: 32
      - maxmem: 32
      - audiovm:
      - guivm:
      - netvm: sys-net
      - provides-network: True
      - vcpus: 1
      - virt-mode: pvh
    - features:
      - enable:
        - qubes-firewall
        - no-default-kernelopts
    - require:
      - file: mirage--copy

{% endif %}
