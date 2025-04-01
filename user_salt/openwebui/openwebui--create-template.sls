{% import "templates/versions.jinja" as version %}

include:
  - templates.templates--install-fedora-minimal

{% if grains['id'] == 'dom0' %}

openwebui-create-template:
  qvm.clone:
    - name: template-openwebui
    - source: fedora-{{ version.fedora }}-minimal
    - class: TemplateVM
    - require:
      - qvm: templates--install-fedora-{{ version.fedora }}-minimal

openwebui--create-template-prefs:
  qvm.prefs:
    - name: template-openwebui
    - label: orange 
    - netvm:
    - audiovm:
    - guivm:
    - require:
      - qvm: openwebui--create-template

{% endif %}
