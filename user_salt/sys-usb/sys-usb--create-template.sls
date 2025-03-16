{% import "templates/versions.jinja" as version %}

include:
  - templates.templates--install-debian-minimal

{% if grains['id'] == 'dom0' %}

sys-usb--create-template:
  qvm.clone:
    - name: template-usb
    - source: debian-{{ version.debian }}-minimal
    - class: TemplateVM
    - require:
      - qvm: templates--install-debian-{{ version.debian }}-minimal

sys-usb--template-prefs:
  qvm.prefs:
    - name: template-usb
    - label: red
    - audiovm: 
    - guivm:
    - netvm: 
    - require:
      - qvm: sys-usb--create-template

{% endif %}
