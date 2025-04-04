{% if grains['id'] == 'template-dev-python' %}

dev-phyton--install-packages:
  pkg.installed:
    - refresh: True
    - pkgs:
      - qubes-app-shutdown-idle
      - tmux
      - neovim
      - git
      - git-lfs
      - python3-virtualenvwrapper
      - tree

{% endif %}
