{% import "templates/versions.jinja" as version %}

include:
  - templates.templates--install-fedora-minimal

{% if grains['id'] == 'dom0' %}

dev-python--create-template:
  qvm.clone:
    - name: template-dev-python
    - source: fedora-{{ version.fedora }}-minimal
    - class: TemplateVM
    - require:
      - qvm: templates--install-fedora-{{ version.fedora }}-minimal

dev-python--template-prefs:
  qvm.prefs:
    - name: template-dev-python
    - label: orange
    - audiovm:
    - guivm:
    - netvm: 
    - require:
      - qvm: dev-python--create-template

{% endif %}
