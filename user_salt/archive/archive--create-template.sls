{% import "templates/versions.jinja" as version %}

include:
  - templates.templates--install-debian-minimal

{% if grains['id'] == 'dom0' %}

archive--create-template:
  qvm.clone:
    - name: template-archive
    - source: debian-{{ version.debian }}-minimal
    - class: TemplateVM
    - require:
      - qvm: templates--install-debian-{{ version.debian }}-minimal

archive--create-template-prefs:
  qvm.prefs:
    - name: template-archive
    - audiovm:
    - guivm: dom0
    - netvm:
    - require:
      - qvm: archive--create-template

{% endif %}
