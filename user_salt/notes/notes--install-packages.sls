{% if grains['id'] == 'template-notes' %}

notes--install-packages:
  pkg.installed:
    - pkgs:
      - qubes-app-shutdown-idle
      - vim-tiny

{% endif %}
