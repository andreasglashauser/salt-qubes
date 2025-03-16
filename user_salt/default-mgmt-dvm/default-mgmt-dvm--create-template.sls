{% import "templates/versions.jinja" as version %}

include:
  - templates.templates--install-debian-minimal

{% if grains['id'] == 'dom0' %}

default-mgmt-dvm--create-template:
  qvm.clone:
    - name: template-default-mgmt-dvm
    - source: debian-{{ version.debian }}-minimal
    - class: TemplateVM
    - require:
      - qvm: templates--install-debian-{{ version.debian }}-minimal

default-mgmt-dvm--create-template-prefs:
  qvm.prefs:
    - name: template-default-mgmt-dvm
    - label: red
    - audiovm:
    - guivm:
    - netvm:
    - require:
      - qvm: default-mgmt-dvm--create-template


{% endif %}
