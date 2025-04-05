{% if grains['id'] == 'template-signal' %}

signal--install-packages:
  pkg.installed:
    - refresh: True
    - pkgs:
      - qubes-core-agent-networking
      - qubes-app-shutdown-idle
      - signal-desktop
      - libayatana-appindicator3-1
      - dunst
      - libatk1.0-0
      - libatk-bridge2.0-0
      - libcups2
      - libgtk-3-0
    - require:
      - pkgrepo: signal--apt-repo

{% endif %}
