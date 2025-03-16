{% import "templates/versions.jinja" as version %}

include:
  - templates.templates--install-debian-minimal

{% if grains['id'] == 'dom0' %}

mullvad-vpn--create-template:
  qvm.clone:
    - name: template-vpn-mullvad
    - source: debian-{{ version.debian }}-minimal
    - class: TemplateVM

mullvad-vpn--template-prefs:
  qvm.prefs:
    - name: template-vpn-mullvad
    - label: red
    - audiovm:
    - guivm:
    - netvm:

mullvad-vpn--create-template-for-tor:
  qvm.clone:
    - name: template-vpn-mullvad-for-tor
    - source: debian-{{ version.debian }}-minimal
    - class: TemplateVM

mullvad-vpn--template-prefs-for-tor:
  qvm.prefs:
    - name: template-vpn-mullvad-for-tor
    - label: red
    - audiovm:
    - guivm:
    - netvm:

{% endif %}
