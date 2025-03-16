{% if grains['id'] == 'template-split-gpg' %}

template-split-gpg--install-packages:
  pkg.installed:
    - refresh: True
    - pkgs:
      - qubes-app-shutdown-idle
      - split-gpg2
      - gnupg

{% elif grains['id'] == 'dom0' %}

template-split-gpg--install-domzero-packages:
  pkg.installed:
    - refresh: True
    - pkgs:
      - split-gpg2-dom0

{% endif %}
