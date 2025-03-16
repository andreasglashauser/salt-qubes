{% import "templates/versions.jinja" as version %}

include:
  - templates.templates--install-debian-minimal

{% if grains['id'] == 'dom0' %}

sys-firewall--create-template:
  qvm.clone:
    - name: template-firewall
    - source: debian-12-minimal
    - class: TemplateVM
    - require:
      - qvm: templates--install-debian-{{ version.debian }}-minimal

sys-firewall--template-prefs:
  qvm.prefs:
    - name: template-firewall
    - label: red
    - audiovm:
    - guivm:
    - netvm:
    - require:
      - qvm: sys-firewall--create-template

{% endif %}
