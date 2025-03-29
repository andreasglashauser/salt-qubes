{% import "templates/versions.jinja" as version %}

include:
  - templates.templates--install-fedora-minimal

{% if grains['id'] == 'dom0' %}

llm--create-template:
  qvm.clone:
    - name: template-llm
    - source: fedora-{{ version.fedora }}-minimal
    - class: TemplateVM
    - require:
      - qvm: templates--install-fedora-{{ version.fedora }}-minimal

llm--create-template-prefs:
  qvm.prefs:
    - name: template-llm
    - label: orange 
    - netvm:
    - audiovm:
    - guivm:
    - require:
      - qvm: llm--create-template

{% endif %}
