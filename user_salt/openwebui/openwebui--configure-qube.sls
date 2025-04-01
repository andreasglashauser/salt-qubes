{% if grains['id'] == 'dom0' %}

openwebui--configure-qube-firewall:
  cmd.run:
    - name: |
        qvm-firewall q-openwebui reset
        qvm-firewall q-openwebui del accept
        qvm-firewall q-openwebui add accept specialtarget=dns
        qvm-firewall q-openwebui add accept proto=icmp
        qvm-firewall q-openwebui add accept ghcr.io proto=tcp
        qvm-firewall q-openwebui add accept pkg-containers.githubusercontent.com proto=tcp
        qvm-firewall q-openwebui add accept openrouter.ai proto=tcp
        qvm-firewall q-openwebui add drop

{% elif grains['id'] == 'q-openwebui' %}

{% set username = 'user' %}
{% set container_name = 'open-webui' %}
{% set service_file_dir = '/home/' ~ username ~ '/.config/systemd/user/' %}
{% set service_file = '/home/' ~ username ~ '/.config/systemd/user/container-' ~ container_name ~ '.service' %}
{% set userid = salt['user.info'](username).uid %}
{% set quadlet_file_dir = '/home/' ~ username ~ '/.config/containers/systemd/' %}
{% set quadlet_file_path = quadlet_file_dir ~ container_name ~ '.container' %}

{% set xdg_runtime_dir = '/run/user' + userid | string %}

openwebui--create-quadlet-dir:
  file.directory:
    - name: /home/{{ username }}/.config/containers/systemd/
    - user: {{ username }}
    - group: {{ username }}
    - makedirs: True

openwebui--deploy-quadlet-file:
  file.managed:
    - name: /home/{{ username }}/.config/containers/systemd/open-webui.container
    - contents: |
        [Unit]
        Description=Open WebUI container managed by Podman
        
        [Container]
        Image=ghcr.io/open-webui/open-webui:ollama
        PublishPort=3000:8080
        Volume=ollama:/root/.ollama
        Volume=open-webui:/app/backend/data
        
        [Service]
        Restart=always
        TimeoutStartSec=1800

        [Install]
        WantedBy=default.target
    - user: {{ username }}
    - group: {{ username }}
    - mode: 644
    - require:
      - file: openwebui--create-quadlet-dir

openwebui--enable-linger:
  cmd.run:
    - name: loginctl enable-linger user
    - unless: loginctl show-user user | grep Linger=yes

openwebui--reload-user-daemon:
  cmd.run:
    - name: |
        systemctl --user daemon-reload
    - runas: {{ username }}
    - env:
      - XDG_RUNTIME_DIR: /run/user/1000
      - DBUS_SESSION_BUS_ADDRESS: unix:path=/run/user/1000/bus
    - require:
      - cmd: openwebui--enable-linger

{% endif %}
