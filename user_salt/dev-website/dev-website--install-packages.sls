{% if grains['id'] == 'template-dev-website' %}

dev-website--install-packages:
  pkg.installed:
    - refresh: True
    - pkgs:
      - qubes-core-agent-networking
      - qubes-app-shutdown-idle
      - neovim
      - tmux
      - git
      - git-delta
      - python3-virtualenvwrapper
      - tree
      - firefox

{% endif %}
