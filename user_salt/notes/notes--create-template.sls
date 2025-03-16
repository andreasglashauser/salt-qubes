{% import "templates/versions.jinja" as version %}

include:
  - templates.templates--install-debian-minimal

{% if grains['id'] == 'dom0' %}

notes--create-template:
  qvm.clone:
    - name: template-notes
    - source: debian-{{ version.debian }}-minimal
    - class: TemplateVM
    - require:
      - qvm: templates--install-debian-{{ version.debian }}-minimal

notes--create-template-prefs:
  qvm.prefs:
    - name: template-notes
    - label: black
    - netvm:
    - audiovm: 
    - guivm:
    - require:
      - qvm: notes--create-template

{% endif %}
