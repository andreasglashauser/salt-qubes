{% import "templates/versions.jinja" as version %}

include: 
  - templates.templates--install-debian-minimal

{% if grains['id'] == 'dom0' %}

sys-audio--create-template:
  qvm.clone:
    - name: template-audio
    - source: debian-{{ version.debian }}-minimal
    - class: TemplateVM
    - require:
      - qvm: templates--install-debian-{{ version.debian }}-minimal

sys-audio--template-prefs:
  qvm.prefs:
    - name: template-audio
    - label: purple
    - audiovm:
    - guivm:
    - netvm:
    - require:
      - qvm: sys-audio--create-template

{% endif %}
