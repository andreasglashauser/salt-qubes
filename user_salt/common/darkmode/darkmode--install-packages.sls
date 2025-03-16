{% if grains['id'] == 'dom0' %}

darkmode--dom0-install-packages:
  pkg.installed:
    - refresh: True
    - pkgs:
      - qt5-qtstyleplugins

{% endif %}
