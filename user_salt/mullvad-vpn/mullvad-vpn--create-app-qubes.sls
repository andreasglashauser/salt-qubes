{% if grains['id'] == 'dom0' %}

sys-vpn-mullvad--create-app-qube:
  qvm.vm:
    - name: app-vpn-mullvad
    - present:
      - template: template-vpn-mullvad
      - label: red
      - template_for_dispvms: True
    - prefs:
      - label: red
      - autostart: False 
      - provides-network: False
      - template_for_dispvms: True
      - audiovm:
      - guivm: dom0
      - netvm:
    - features:
      - set:
        - menu-items: debian-xterm.desktop mullvad-vpn.desktop
    - require:
      - qvm: mullvad-vpn--create-template

sys-vpn-mullvad--create-qube:
  qvm.vm:
    - name: sys-vpn-mullvad
    - present:
      - template: app-vpn-mullvad
      - label: red
      - class: DispVM
    - prefs:
      - label: red
      - autostart: True
      - provides-network: True
      - audiovm:
      - guivm: dom0
      - netvm: sys-firewall
    - features:
      - set:
        - menu-items: debian-xterm.desktop mullvad-vpn.desktop
    - require:
      - qvm: sys-vpn-mullvad--create-app-qube

sys-vpn-mullvad--create-app-qube-for-tor:
  qvm.vm:
    - name: app-vpn-mullvad-for-tor
    - present:
      - template: template-vpn-mullvad-for-tor
      - label: red
      - template_for_dispvms: True
    - prefs:
      - label: red
      - autostart: False 
      - provides-network: False
      - template_for_dispvms: True
      - audiovm:
      - guivm: dom0
      - netvm: 
    - features:
      - set:
        - menu-items: debian-xterm.desktop mullvad-vpn.desktop
    - require:
      - qvm: mullvad-vpn--create-template-for-tor

sys-vpn-mullvad--create-qube-for-tor:
  qvm.vm:
    - name: sys-vpn-mullvad-for-tor
    - present:
      - template: app-vpn-mullvad-for-tor
      - label: red
      - class: DispVM
    - prefs:
      - label: red
      - autostart: True
      - provides-network: True
      - audiovm:
      - guivm: dom0
      - netvm: sys-firewall
    - features:
      - set:
        - menu-items: debian-xterm.desktop mullvad-vpn.desktop
    - require:
      - qvm: sys-vpn-mullvad--create-app-qube-for-tor

{% endif %}
