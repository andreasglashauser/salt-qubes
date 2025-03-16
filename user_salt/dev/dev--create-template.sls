{% import "templates/versions.jinja" as version %}

include:
  - templates.templates--install-fedora-minimal

{% if grains['id'] == 'dom0' %}

dev--create-template:
  qvm.clone:
    - name: template-dev
    - source: fedora-{{ version.fedora }}-minimal
    - class: TemplateVM
    - require:
      - qvm: templates--install-fedora-{{ version.fedora }}-minimal

dev--template-prefs:
  qvm.prefs:
    - name: template-dev
    - label: orange
    - audiovm:
    - guivm:
    - netvm: 
    - require:
      - qvm: dev--create-template

{% endif %}
