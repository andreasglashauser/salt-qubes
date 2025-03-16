{% if grains['id'] == 'template-net' %}

sys-net--install-packages:
  pkg.installed:
    - refresh: True
    - pkgs:
      - qubes-core-agent-networking
      - qubes-core-agent-network-manager
      - NetworkManager-wifi
      - network-manager-applet
      - polkit

{% endif %}
