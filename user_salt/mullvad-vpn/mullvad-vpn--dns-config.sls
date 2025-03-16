{% if grains['id'] == 'app-vpn-mullvad' or grains['id'] == 'app-vpn-mullvad-for-tor' %}

mullvad-vpn--dns-config:
  file.managed:
    - names:
      - /usr/local/bin/mullvad-dns.sh:
        - source: salt://mullvad-vpn/files/mullvad-dns.sh
        - mode: 755

mullvad-vpn--dns-config-appends:
  file.append:
    - names:
      - /rw/config/rc.local:
        - source: salt://mullvad-vpn/files/rc.local
      - /rw/config/qubes-firewall-user-script:
        - source: salt://mullvad-vpn/files/qubes-firewall-user-script

{% endif %}
