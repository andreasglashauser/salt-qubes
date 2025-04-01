{% if grains['id'] == 'dom0' %}

split-ssh--configure-dom0:
  file.managed:
    - name: /etc/qubes/policy.d/50-ssh.policy
    - source: salt://split-ssh/files/50-ssh.policy

split-ssh--configure-firewall:
   cmd.run:
    - name: |
        qvm-firewall q-ssh reset
        qvm-firewall q-ssh del accept
        qvm-firewall q-ssh add accept 138.199.226.242/32 proto=tcp
        qvm-firewall q-ssh add accept 162.55.181.96/32 proto=tcp
        qvm-firewall q-ssh add accept 116.202.96.31/32 proto=tcp
        qvm-firewall q-ssh add drop
    - unless: |
        CURRENT=$(qvm-firewall --raw q-ssh list)
        DESIRED=$(echo -e 'action=accept proto=tcp dst4=138.199.226.242/32
        action=accept proto=tcp dst4=162.55.181.96/32
        action=accept proto=tcp dst4=116.202.96.31/32
        action=drop')
        [ "$CURRENT" = "$DESIRED" ]
    - output_loglevel: quiet


{% elif grains['id'] == 'app-split-ssh' %}

split-ssh--configure-app-split-ssh:
  file.managed:
    - name: /home/user/.config/autostart/ssh-add.desktop
    - source: salt://split-ssh/files/ssh-add.desktop
    - makedirs: True

{% elif grains['id'] == 'template-split-ssh' %}

split-ssh--configure-template-split-ssh:
  file.managed:
    - name: /etc/qubes-rpc/qubes.SshAgent
    - source: salt://split-ssh/files/qubes.SshAgent
    - mode: 755

{% elif grains['id'] == 'app-ssh' or 'dev' in grains['id'] and 'template' not in grains['id'] %}

{% if grains['id'] == 'app-ssh' %}
include:
  - split-gpg.split-gpg--configure-gpg
{% endif %}

split-ssh--ensure-rclocal-exists:
  file.managed:
    - name: /rw/config/rc.local
    - user: root
    - group: root
    - mode: 755
    - create: True
    - replace: False

split-ssh--configure-rclocal:
  file.blockreplace:
    - name: /rw/config/rc.local
    - marker_start: "# {mark} SPLIT_SSH (SALT) - START"
    - marker_end: "# {mark} SPLIT_SSH (SALT) - END"
    - content: |
        # SPLIT SSH CONFIGURATION >>>
        # replace "vault" with your AppVM name which stores the ssh private key(s)
        SSH_VAULT_VM="q-split-ssh"
        
        if [ "$SSH_VAULT_VM" != "" ]; then
          export SSH_SOCK="/home/user/.SSH_AGENT_$SSH_VAULT_VM"
          rm -f "$SSH_SOCK"
          sudo -u user /bin/sh -c "umask 177 && exec socat 'UNIX-LISTEN:$SSH_SOCK,fork' 'EXEC:qrexec-client-vm $SSH_VAULT_VM qubes.SshAgent'" &
        fi
        # <<< SPLIT SSH CONFIGURATION
    - append_if_not_found: True
    - show_changes: True
    - require:
      - file: split-ssh--ensure-rclocal-exists

split-ssh--ensure-bashrc-exists:
  file.managed:
    - name: /home/user/.bashrc
    - user: root
    - group: root
    - mode: 644
    - create: True
    - replace: False

split-ssh--configure-bashrc:
  file.blockreplace:
    - name: /home/user/.bashrc
    - marker_start: "# {mark} SPLIT_SSH (SALT) - START"
    - marker_end: "# {mark} SPLIT_SSH (SALT) - END"
    - content: |
        # SPLIT SSH CONFIGURATION >>>
        # replace "vault" with your AppVM name which stores the ssh private key(s)
        SSH_VAULT_VM="q-split-ssh"
        
        if [ "$SSH_VAULT_VM" != "" ]; then
                export SSH_AUTH_SOCK="/home/user/.SSH_AGENT_$SSH_VAULT_VM"
        fi
        # <<< SPLIT SSH CONFIGURATION
    - append_if_not_found: True
    - show_changes: True
    - require:
      - file: split-ssh--ensure-bashrc-exists

{% endif %}
