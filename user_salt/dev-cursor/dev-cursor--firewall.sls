{% if grains['id'] == 'dom0' %}

dev-cursor--firewall:
  cmd.run:
    - name: |
        qvm-firewall q-dev-cursor reset
        qvm-firewall q-dev-cursor del accept
        qvm-firewall q-dev-cursor add accept specialtarget=dns
        qvm-firewall q-dev-cursor add accept proto=icmp
        qvm-firewall q-dev-cursor add accept api2.cursor.sh proto=tcp
        qvm-firewall q-dev-cursor add accept api3.cursor.sh proto=tcp
        qvm-firewall q-dev-cursor add accept repo42.cursor.sh proto=tcp
        qvm-firewall q-dev-cursor add accept api4.cursor.sh proto=tcp
        qvm-firewall q-dev-cursor add accept cursor-cdn.com proto=tcp
        qvm-firewall q-dev-cursor add accept github.com proto=tcp
        qvm-firewall q-dev-cursor add accept git.andreasglashauser.com proto=tcp
        #qvm-firewall q-dev-cursor add accept downloads.cursor.com proto=tcp
        #qvm-firewall q-dev-cursor add accept objects.githubusercontent.com proto=tcp
        qvm-firewall q-dev-cursor add drop

    - unless: |
        CURRENT=$(qvm-firewall --raw q-dev-cursor list)
        DESIRED=$(echo -e 'action=accept specialtarget=dns
        action=accept proto=icmp
        action=accept proto=tcp dsthost=api2.cursor.sh
        action=accept proto=tcp dsthost=api3.cursor.sh
        action=accept proto=tcp dsthost=repo42.cursor.sh
        action=accept proto=tcp dsthost=api4.cursor.sh
        action=accept proto=tcp dsthost=cursor-cdn.com
        action=accept proto=tcp dsthost=github.com
        action=accept proto=tcp dsthost=git.andreasglashauser.com
        action=drop')
        [ "$CURRENT" = "$DESIRED" ]
    - require:
      - qvm: dev-cursor--create-qube

        #action=accept proto=tcp dsthost=downloads.cursor.com
        #action=accept proto=tcp dsthost=objects.githubusercontent.com

{% endif %}
