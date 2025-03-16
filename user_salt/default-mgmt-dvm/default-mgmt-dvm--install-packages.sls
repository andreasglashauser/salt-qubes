{% if grains['id'] == 'template-default-mgmt-dvm' %}

default-mgmt-dvm--install-packages:
  pkg.installed:
    - refresh: True
    - pkgs:
      - qubes-core-agent-passwordless-root
      - qubes-mgmt-salt-vm-connector

{% endif %}
