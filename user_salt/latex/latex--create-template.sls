{% import "templates/versions.jinja" as version %}

include:
  - templates.templates--install-fedora-minimal

{% if grains['id'] == 'dom0' %}

latex--create-template:
  qvm.clone:
    - name: template-latex
    - source: fedora-{{ version.fedora }}-minimal
    - class: TemplateVM
    - require:
      - qvm: templates--install-fedora-{{ version.fedora }}-minimal

latex--template-prefs:
  qvm.prefs:
    - name: template-latex
    - label: orange
    - audiovm:
    - guivm:
    - netvm: 
    - require:
      - qvm: latex--create-template

{% endif %}
