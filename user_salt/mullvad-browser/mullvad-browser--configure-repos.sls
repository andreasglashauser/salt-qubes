{% if grains['id'] == 'template-mullvad-browser' %}

mullvad-browser--configure-repos:
  file.managed:
    - names:
      - /usr/share/keyrings/mullvad-keyring.asc:
        - source: salt://mullvad-browser/files/mullvad-keyring.asc
      - /etc/apt/sources.list.d/mullvad.list:
        - source: salt://mullvad-browser/files/mullvad.list

{% endif %}
