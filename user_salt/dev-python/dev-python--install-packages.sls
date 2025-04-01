{% if grains['id'] == 'template-dev-python' %}

dev-phyton--install-packages:
  pkg.installed:
    - refresh: True
    - pkgs:
      - qubes-core-agent-networking
      - qubes-app-shutdown-idle
      - tmux
      - neovim
      - git
      - git-delta
      - python3-virtualenvwrapper
      - tree

{% endif %}
