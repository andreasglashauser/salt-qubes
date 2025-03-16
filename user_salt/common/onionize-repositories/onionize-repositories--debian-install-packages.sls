{% if grains['os'] == 'Debian' and 'whonix' not in grains['id'] %}

onionize-repositories--debian-install-packages:
  pkg.installed:
    - pkgs:
      - apt-transport-tor

{% endif %}
