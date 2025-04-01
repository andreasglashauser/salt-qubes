{% if grains['id'] == 'dom0' %}

mullvad-browser--create-qube:
  qvm.vm:
    - name: q-mullvad-browser
    - present:
      - template: template-mullvad-browser
      - label: red
    - prefs:
      - label: red
      - audiovm: sys-audio
      - guivm: dom0
      - netvm: sys-vpn-mullvad
      - template_for_dispvms: True
    - features:
      - set:
        - menu-items: mullvad-browser-alpha.desktop mullvad-browser.desktop debian-xterm.desktop
    - require:
      - qvm: mullvad-browser--create-template

{% endif %}
