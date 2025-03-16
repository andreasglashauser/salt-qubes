{% if grains['id'] == 'template-vpn-mullvad' or grains['id'] == 'template-vpn-mullvad-for-tor' %}

mullvad-vpn--install-packages:
  pkg.installed:
    - refresh: True
    - pkgs:
      - qubes-core-agent-networking
      - mullvad-vpn
      - libnss3
      - inotify-tools
      - libasound2
    - require:
      - file: mullvad-vpn--configure-repos

{% endif %}
