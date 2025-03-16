xterm--configure-xresources:
  file.managed:
    - name: /home/user/.Xresources
    - source: salt://xterm/files/Xresources
    - user: user
    - group: user
    - mode: 644

{% set users = salt['cmd.run']('getent passwd | grep /home | cut -d: -f1').splitlines() %}

{% for user in users %}

xterm--confgiure-xresources-merge:
  cmd.run:
    - name: xrdb -merge /home/{{ user }}/.Xresources
    - user: {{ user }}

{% endfor %}
