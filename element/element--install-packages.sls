{% if grains['id'] == 'template-element' %}

element--install-packages:
  pkg.installed:
    - refresh: True
    - pkgs:
      - qubes-core-agent-networking
      - qubes-app-shutdown-idle
      - element-desktop
    - require:
      - pkgrepo: element--apt-repo

{% endif %}
