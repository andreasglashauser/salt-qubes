{% import "templates/versions.jinja" as version %}

include:
  - templates.templates--install-debian-minimal

{% if grains['id'] == 'dom0' %}

offline-btc--create-template:
  qvm.clone:
    - name: template-btc-offline
    - source: debian-{{ version.debian }}-minimal
    - class: TemplateVM
    - require:
      - qvm: templates--install-debian-{{ version.debian }}-minimal

offline-btc--template-prefs:
  qvm.prefs:
    - name: template-btc-offline
    - label: black
    - audiovm:
    - guivm: 
    - netvm:
    - require:
      - qvm: offline-btc--create-template

btc--create-template:
  qvm.clone:
    - name: template-btc
    - source: debian-12-minimal
    - class: TemplateVM
    - require:
      - qvm: templates--install-debian-{{ version.debian }}-minimal

btc--template-prefs:
  qvm.prefs:
    - name: template-btc
    - label: red
    - audiovm:
    - guivm: 
    - netvm:
    - require:
      - qvm: btc--create-template

{% endif %}
