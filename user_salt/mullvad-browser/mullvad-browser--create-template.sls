{% import "templates/versions.jinja" as version %}

include:
  - templates.templates--install-debian-minimal

{% if grains['id'] == 'dom0' %}

mullvad-browser--create-template:
  qvm.clone:
    - name: template-mullvad-browser
    - source: debian-{{ version.debian }}-minimal
    - class: TemplateVM
    - require:
      - qvm: templates--install-debian-{{ version.debian }}-minimal

mullvad-browser--template-prefs:
  qvm.prefs:
    - name: template-mullvad-browser
    - label: red
    - audiovm:
    - guivm:
    - netvm:
    - require:
      - qvm: mullvad-browser--create-template

{% endif %}
