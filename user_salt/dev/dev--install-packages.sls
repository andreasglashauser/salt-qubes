{% if grains['id'] == 'template-dev' %}

dev--install-packages:
  pkg.installed:
    - refresh: True
    - pkgs:
      - qubes-core-agent-networking
      - qubes-app-shutdown-idle
      - neovim
      - tmux
      - git
      - git-lfs
      - git-delta
      - python3-virtualenvwrapper
      - knock

{% endif %}
