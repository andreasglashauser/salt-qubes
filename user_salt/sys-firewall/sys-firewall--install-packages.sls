{% if grains['id'] == 'template-firewall' %}

sys-firewall--install-packages:
  pkg.installed:
    - refresh: True
    - pkgs:
      - qubes-core-agent-networking
      - qubes-core-agent-dom0-updates

{% endif %}
