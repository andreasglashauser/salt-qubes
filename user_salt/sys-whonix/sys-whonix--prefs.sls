{% import "templates/versions.jinja" as version %}

include:
  - templates.templates--install-whonix-gw

{% if grains['id'] == 'dom0' %}

sys-whonix--prefs:
  qvm.prefs:
    - name: sys-whonix
    - netvm: sys-vpn-mullvad-for-tor
    - audiovm:
    - guivm:
    - require:
      - qvm: templates--install-whonix-gw-{{ version.whonix }}

{% endif %}
