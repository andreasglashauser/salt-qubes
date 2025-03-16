{% import "templates/versions.jinja" as version %}

include:
  - templates.templates--install-debian-minimal

{% if grains['id'] == 'dom0' %}

default-dvm--create-template:
  qvm.clone:
    - name: template-default-dvm
    - source: debian-{{ version.debian }}-minimal
    - class: TemplateVM
    - require:
      - qvm: templates--install-debian-{{ version.debian }}-minimal

default-dvm--template-prefs:
  qvm.prefs:
    - name: template-default-dvm
    - label: purple
    - audiovm: 
    - guivm: dom0
    - netvm: 
    - require:
      - qvm: default-dvm--create-template

{% endif %}
