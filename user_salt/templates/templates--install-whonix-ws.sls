{% import "templates/versions.jinja" as version %}

{% if grains['id'] == 'dom0' %}

templates--install-whonix-ws-{{ version.whonix }}:
  qvm.template_installed:
    - name: whonix-workstation-{{ version.whonix }}
    - fromrepo: qubes-templates-itl

templates--whonix-ws-{{ version.whonix }}-prefs:
  qvm.prefs:
     - name: whonix-workstation-{{ version.whonix }}
     - audiovm:
     - guivm:
     - netvm:

{% endif %}
