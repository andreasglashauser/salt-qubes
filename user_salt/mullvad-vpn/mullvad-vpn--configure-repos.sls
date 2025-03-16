{% if grains['id'] == 'template-vpn-mullvad' or grains['id'] == 'template-vpn-mullvad-for-tor' %}

mullvad-vpn--configure-repos:
  file.managed:
    - names:
      - /usr/share/keyrings/mullvad-keyring.asc:
        - source: salt://mullvad-vpn/files/mullvad-keyring.asc
      - /etc/apt/sources.list.d/mullvad.list:
        - source: salt://mullvad-vpn/files/mullvad.list

{% endif %}
