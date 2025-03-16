{% if grains['id'] == 'template-pwmanager' %}

template-pwmanager-install-apps:
  pkg.installed:
    - install_recommends: True
    - pkgs:
      - keepassxc

{% endif %}
