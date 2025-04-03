{% if grains['id'] == 'template-latex' %}

dev--install-packages:
  pkg.installed:
    - refresh: True
    - pkgs:
      - qubes-app-shutdown-idle
      - neovim
      - tmux
      - texlive-scheme-full
      - zathura

{% endif %}
