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
      - tree
      - firefox
      - sqlite3
      - podman
      - podman-compose
      - python3.11
      - tcpdump
      - fuse-libs

{% endif %}
