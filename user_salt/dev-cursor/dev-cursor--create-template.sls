{% import "templates/versions.jinja" as version %}

include:
  - templates.templates--install-fedora-minimal

{% if grains['id'] == 'dom0' %}

dev-cursor--create-template:
  qvm.clone:
    - name: template-dev-cursor
    - source: fedora-{{ version.fedora }}-minimal
    - class: TemplateVM
    - require:
      - qvm: templates--install-fedora-{{ version.fedora }}-minimal

dev-cursor--template-prefs:
  qvm.prefs:
    - name: template-dev-cursor
    - label: orange
    - audiovm:
    - guivm:
    - netvm: 
    - require:
      - qvm: dev-cursor--create-template

{% endif %}
