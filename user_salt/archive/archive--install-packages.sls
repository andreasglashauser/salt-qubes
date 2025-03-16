{% if grains['id'] == 'template-archive' %}

archive--install-packages:
  pkg.installed:
    - refresh: True
    - pkgs:
      - qubes-app-shutdown-idle

{% endif %}
