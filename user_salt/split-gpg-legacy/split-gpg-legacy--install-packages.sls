{% if grains['id'] == 'template-split-gpg-legacy' %}

template-split-gpg-legacy--install-packages:
  pkg.installed:
    - refresh: True
    - pkgs:
      - qubes-gpg-split
      - qubes-app-shutdown-idle
      - gnupg

{% endif %}
