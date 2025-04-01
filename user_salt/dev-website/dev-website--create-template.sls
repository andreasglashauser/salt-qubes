{% import "templates/versions.jinja" as version %}

include:
  - templates.templates--install-fedora-minimal

{% if grains['id'] == 'dom0' %}

dev-website--create-template:
  qvm.clone:
    - name: template-dev-website
    - source: fedora-{{ version.fedora }}-minimal
    - class: TemplateVM
    - require:
      - qvm: templates--install-fedora-{{ version.fedora }}-minimal

dev-website--template-prefs:
  qvm.prefs:
    - name: template-dev-website
    - label: orange
    - audiovm:
    - guivm:
    - netvm: 
    - require:
      - qvm: dev-website--create-template

{% endif %}
