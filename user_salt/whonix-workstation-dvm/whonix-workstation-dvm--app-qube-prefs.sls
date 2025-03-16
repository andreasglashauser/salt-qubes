{% import "templates/versions.jinja" as version %}

include:
  - templates.templates--install-whonix-ws

{% if grains['id'] == 'dom0' %}

whonix-workstation-dvm--app-qube-prefs:
  qvm.prefs:
    - name: whonix-workstation-{{ version.whonix }}-dvm
    - audiovm: sys-audio
    - guivm: dom0
    - netvm: sys-whonix
    - require:
      - qvm: templates--install-whonix-ws-{{ version.whonix }}

{% endif %}
