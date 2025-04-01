{% if grains['id'] == 'dom0' %}

dev-website--firewall:
  cmd.run:
    - name: |
        qvm-firewall q-dev-website reset
        qvm-firewall q-dev-website del accept
        qvm-firewall q-dev-website add accept specialtarget=dns
        qvm-firewall q-dev-website add accept proto=icmp
        qvm-firewall q-dev-website add accept github.com proto=tcp
        qvm-firewall q-dev-website add accept git.andreasglashauser.com proto=tcp
        qvm-firewall q-dev-website add drop
    - unless: |
        CURRENT=$(qvm-firewall --raw q-dev-website list)
        DESIRED=$(echo -e 'action=accept specialtarget=dns
        action=accept proto=icmp
        action=accept proto=tcp dsthost=github.com
        action=accept proto=tcp dsthost=git.andreasglashauser.com
        action=drop')
        [ "$CURRENT" = "$DESIRED" ]
    - output_loglevel: quiet
    - require:
      - qvm: dev-website--create-qube

{% endif %}
