{% if grains['os'] == 'Debian' %}

remove-unwanted--debian-packages:
  pkg.removed:
    - names:
      - less
      - nano
      - tasksel
      - less
      - vim-common
      - nftables
      - fdisk
      - eatmydata
      - aptitude

remove-unwanted--apt-cleanup:
  cmd.run:
    - name: "apt-get autoremove -y && apt-get clean && apt-get autopurge"
    - onchanges:
      - pkg: remove-unwanted--debian-packages

{% endif %}
