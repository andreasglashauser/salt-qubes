{% if grains['id'] == 'template-usb' %}

sys-usb--install-packages:
  pkg.installed:
    - refresh: True
    - pkgs:
      - qubes-usb-proxy
      - qubes-input-proxy-sender

{% endif %}
