{% import "templates/versions.jinja" as version %}

include:
  - templates.templates--install-debian-minimal

{% if grains['id'] == 'dom0' %}

signal--create-template:
  qvm.clone:
    - name: template-signal
    - source: debian-{{ version.debian }}-minimal
    - class: TemplateVM
    - require:
      - qvm: templates--install-debian-{{ version.debian }}-minimal

signal--create-template-prefs:
  qvm.prefs:
    - name: template-signal
    - label: yellow
    - audiovm:
    - guivm:
    - netvm:
    - require:
      - qvm: signal--create-template

{% endif %}
