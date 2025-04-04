{% if grains['id'] == 'template-openwebui' %}

openwebui--install-packages:
  pkg.installed:
    - pkgs:
      - qubes-core-agent-networking
      - qubes-app-shutdown-idle
      - podman
      - firefox
      - vim-tiny

{% endif %}
