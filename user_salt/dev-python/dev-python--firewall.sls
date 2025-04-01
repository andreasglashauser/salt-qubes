{% if grains['id'] == 'dom0' %}

dev-python--firewall:
  cmd.run:
    - name: |
        qvm-firewall q-dev-python reset
        qvm-firewall q-dev-python del accept
        qvm-firewall q-dev-python add accept specialtarget=dns
        qvm-firewall q-dev-python add accept proto=icmp
        qvm-firewall q-dev-python add accept github.com proto=tcp
        qvm-firewall q-dev-python add accept git.andreasglashauser.com proto=tcp
        qvm-firewall q-dev-python add drop
    - unless: |
        CURRENT=$(qvm-firewall --raw q-dev-python list)
        DESIRED=$(echo -e 'action=accept specialtarget=dns
        action=accept proto=icmp
        action=accept proto=tcp dsthost=github.com
        action=accept proto=tcp dsthost=git.andreasglashauser.com
        action=drop')
        [ "$CURRENT" = "$DESIRED" ]
    - output_loglevel: quiet

{% endif %}
