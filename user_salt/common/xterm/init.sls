xterm--configure-xresources:
  file.managed:
    - name: /home/user/.Xresources
    - contents: |
        xterm*scrollBar: false
        xterm*background: black
        xterm*foreground: white
        xterm*selectToClipboard: true
        ! if you do a double click on a ling, xterm now automatically selects the whole link
        xterm*charClass: 33:48,35-39:48,42-47:48,58-59:48,61:48,63:48,64:48,91-93:48,95:48,126:48
    - user: user
    - group: user
    - mode: 644

xterm--configure-xresources-merge:
  cmd.run:
    - name: xrdb -merge /home/user/.Xresources
    - runas: user
