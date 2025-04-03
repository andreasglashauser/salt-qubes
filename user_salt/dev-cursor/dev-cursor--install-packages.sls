{% if grains['id'] == 'template-dev-cursor' %}

dev-cursor--install-packages:
  pkg.installed:
    - refresh: True
    - pkgs:
      - qubes-core-agent-networking
      - qubes-app-shutdown-idle
      - git
      - python3-virtualenvwrapper
      - tree
      - fuse-libs

{% endif %}
