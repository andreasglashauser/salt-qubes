{% if grains['id'] == 'template-mullvad-browser' %} 
 
mullvad-browser--install-packages:
  pkg.installed: 
    - refresh: True 
    - pkgs:
      - qubes-core-agent-networking
      - mullvad-browser
      - pulseaudio-qubes
      - vim-tiny
    - require:
      - file: mullvad-browser--configure-repos
 
{% endif %} 
