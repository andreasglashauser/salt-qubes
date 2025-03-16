{% if grains['id'] == 'dom0' %}

remove-unwanted--domzero-packages:
  pkg.removed:
    - pkgs:
      - nano
      - pipewire
      - pavucontrol
      - alsa-utils

{% endif %}
