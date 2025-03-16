{% if grains['id'] == 'template-audio' %}

sys-audio---install-packages:
  pkg.installed:
    - refresh: True
    - pkgs:
      - qubes-audio-daemon
      - qubes-core-admin-client
      - qubes-usb-proxy
      - pipewire-qubes
      - pavucontrol
      - alsa-utils
      - pasystray

{% endif %}
