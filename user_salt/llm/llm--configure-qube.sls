{% if grains['id'] == 'dom0' %}

llm--configure-qube-firewall:
  cmd.run:
    - name: |
        qvm-firewall q-llm reset
        qvm-firewall q-llm del accept
        qvm-firewall q-llm add accept specialtarget=dns
        qvm-firewall q-llm add accept proto=icmp
        qvm-firewall q-llm add accept ghcr.io proto=tcp
        qvm-firewall q-llm add accept pkg-containers.githubusercontent.com proto=tcp
        qvm-firewall q-llm add accept openrouter.ai proto=tcp
        qvm-firewall q-llm add drop

{% elif grains['id'] == 'q-llm' %}

{% set username = 'user' %}
{% set container_name = 'open-webui' %}
{% set service_file_dir = '/home/' ~ username ~ '/.config/systemd/user/' %}
{% set service_file = '/home/' ~ username ~ '/.config/systemd/user/container-' ~ container_name ~ '.service' %}
{% set userid = salt['user.info'](username).uid %}
{% set quadlet_file_dir = '/home/' ~ username ~ '/.config/containers/systemd/' %}
{% set quadlet_file_path = quadlet_file_dir ~ container_name ~ '.container' %}

{% set xdg_runtime_dir = '/run/user' + userid | string %}

llm--create-quadlet-dir:
  file.directory:
    - name: /home/{{ username }}/.config/containers/systemd/
    - user: {{ username }}
    - group: {{ username }}
    - makedirs: True

llm--deploy-quadlet-file:
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
      - file: llm--create-quadlet-dir

llm--enable-linger:
  cmd.run:
    - name: loginctl enable-linger user
    - unless: loginctl show-user user | grep Linger=yes

llm--reload-user-daemon:
  cmd.run:
    - name: |
        systemctl --user daemon-reload
    - runas: {{ username }}
    - env:
      - XDG_RUNTIME_DIR: /run/user/1000
      - DBUS_SESSION_BUS_ADDRESS: unix:path=/run/user/1000/bus
    - require:
      - cmd: llm--enable-linger

{% endif %}
