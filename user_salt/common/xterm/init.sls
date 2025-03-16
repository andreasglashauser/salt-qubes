/home/user/.Xresources:
  file.managed:
    - source: salt://common/xterm/files/Xresources
    - mode: 0644
    - user: user
    - group: user

"xrdb -merge /home/user/.Xresources":
  cmd.run:
    - user: user
