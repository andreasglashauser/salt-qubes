{% import "templates/versions.jinja" as version %}

include:
  - templates.templates--install-debian-minimal

{% if grains['id'] == 'dom0' %}

pwmanager--create-template:
  qvm.clone:
    - name: template-pwmanager
    - source: debian-{{ version.debian }}-minimal
    - class: TemplateVM
    - require:
      - qvm: templates--install-debian-{{ version.debian }}-minimal

wmanager--create-template-prefs:
  qvm.prefs:
    - name: template-pwmanager
    - audiovm:
    - guivm:
    - netvm:
    - require:
      - qvm: pwmanager--create-template

{% endif %}
