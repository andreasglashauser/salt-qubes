{% import "templates/versions.jinja" as version %}

{% if grains['id'] == 'dom0' %}

templates--install-debian-{{ version.debian }}-minimal:
  qvm.template_installed:
    - name: debian-{{ version.debian }}-minimal
    - fromrepo: qubes-templates-itl

templates--debian-{{ version.debian }}-minimal-prefs:
  qvm.prefs:
     - name: debian-{{ version.debian }}-minimal
     - audiovm:
     - guivm:
     - netvm:

{% endif %}
