{% import "templates/versions.jinja" as version %}

{% if grains['id'] == 'dom0' %}

templates--install-fedora-{{ version.fedora }}-minimal:
  qvm.template_installed:
    - name: fedora-{{ version.fedora }}-minimal
    - fromrepo: qubes-templates-itl

templates--fedora-{{ version.fedora }}-minimal-prefs:
  qvm.prefs:
    - name: fedora-{{ version.fedora }}-minimal
    - audiovm:
    - guivm:
    - netvm:

{% endif %}
