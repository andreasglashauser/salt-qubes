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

{% elif grains['id'] == 'app-ssh' %}

include:
  - split-gpg.split-gpg--configure-gpg

split-ssh--configure-app-ssh:
  file.append:
    - names:
      - /rw/config/rc.local:
        - source: salt://split-ssh/files/rc.local
      - /home/user/.bashrc:
        - source: salt://split-ssh/files/bashrc

{% endif %}
