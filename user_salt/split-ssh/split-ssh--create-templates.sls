{% import "templates/versions.jinja" as version %}

include:
  - templates.templates--install-debian-minimal

{% if grains['id'] == 'dom0' %}

split-ssh--create-template:
  qvm.clone:
    - name: template-split-ssh
    - source: debian-{{ version.debian }}-minimal
    - class: TemplateVM
    - require:
      - qvm: templates--install-debian-{{ version.debian }}-minimal

split-ssh--template-split-ssh-prefs:
  qvm.prefs:
    - name: template-split-ssh
    - label: black
    - audiovm:
    - guivm:
    - netvm:
    - require:
      - qvm: split-ssh--create-template

ssh--create-template:
  qvm.clone:
    - name: template-ssh
    - source: debian-{{ version.debian }}-minimal
    - class: TemplateVM
    - require:
      - qvm: templates--install-debian-{{ version.debian }}-minimal

ssh--template-split-ssh-prefs:
  qvm.prefs:
    - name: template-ssh
    - label: yellow
    - audiovm:
    - guivm:
    - netvm:
    - require:
      - qvm: ssh--create-template

{% endif %}
