{% if grains['id'] == 'template-llm' %}

llm--install-packages:
  pkg.installed:
    - pkgs:
      - qubes-core-agent-networking
      - qubes-app-shutdown-idle
      - podman
      - firefox

{% endif %}
