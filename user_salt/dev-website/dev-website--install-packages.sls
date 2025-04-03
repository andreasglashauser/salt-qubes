{% if grains['id'] == 'template-dev-website' %}

dev-website--install-packages:
  pkg.installed:
    - refresh: True
    - pkgs:
      - qubes-app-shutdown-idle
      - neovim
      - tmux
      - git
      - python3-virtualenvwrapper
      - tree
      - firefox

{% endif %}
