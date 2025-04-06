{% import "templates/versions.jinja" as version %}

include:
  - templates.templates--install-debian-minimal

{% if grains['id'] == 'dom0' %}

element--create-template:
  qvm.clone:
    - name: template-element
    - source: debian-{{ version.debian }}-minimal
    - class: TemplateVM
    - require:
      - qvm: templates--install-debian-{{ version.debian }}-minimal

element--create-template-prefs:
  qvm.prefs:
    - name: template-element
    - label: yellow
    - audiovm:
    - guivm:
    - netvm:
    - require:
      - qvm: element--create-template

{% endif %}
