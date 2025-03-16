{% import "templates/versions.jinja" as version %}

include:
  - templates.templates--install-debian-minimal

{% if grains['id'] == 'dom0' %}

split-gpg--create-template:
  qvm.clone:
    - name: template-split-gpg
    - source: debian-{{ version.debian }}-minimal
    - class: TemplateVM
    - require:
      - qvm: templates--install-debian-{{ version.debian }}-minimal

split-gpg--template-prefs:
  qvm.prefs:
    - name: template-split-gpg
    - label: black
    - audiovm:
    - guivm: dom0
    - netvm:
    - require:
      - qvm: split-gpg--create-template

{% endif %}

