{% if grains['id'] == 'template-btc-offline' %}

template-btc-offline--install-packages:
  pkg.installed:
    - refresh: True
    - pkgs:
      - qubes-app-shutdown-idle
      - electrum

{% endif %}


{% if grains['id'] == 'template-btc' %}

template-btc--install-packages:
  pkg.installed:
    - refresh: True
    - pkgs:
      - qubes-core-agent-networking
      - qubes-app-shutdown-idle
      - electrum

{% endif %}
