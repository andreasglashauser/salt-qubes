{% import "templates/versions.jinja" as version %}

include:
  - templates.templates--install-fedora-minimal

{% if grains['id'] == 'dom0' %}

sys-net--create-template:
  qvm.clone:
    - name: template-net
    - source: fedora-{{ version.fedora }}-minimal
    - class: TemplateVM
    - require:
      - qvm: templates--install-fedora-{{ version.fedora }}-minimal

sys-net--template-prefs:
  qvm.prefs:
    - name: template-net
    - label: red
    - audiovm:
    - guivm:
    - netvm:
    - require:
      - qvm: sys-net--create-template

{% endif %}
