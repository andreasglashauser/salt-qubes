{% set cursor_version = '0.47.9' %}
{% set vscode_vim_version = '1.29.0' %}


{% if grains['id'] == 'q-dev-cursor' %}

dev-cursor--install-cursor:
  cmd.run:
    - name: curl --tlsv1.3 -LO --output-dir "/home/user/" "https://downloads.cursor.com/production/b6fb41b5f36bda05cab7109606e7404a65d1ff32/linux/x64/Cursor-{{ cursor_version }}-x86_64.AppImage"
    - runas: user
    - unless: test -f /home/user/Cursor-{{ cursor_version }}-x86_64.AppImage

dev-cursor--appimage-executable:
  cmd.run:
    - name: chmod +x /home/user/Cursor-{{ cursor_version }}-x86_64.AppImage
    - runas: user
    - unless: test -x /home/user/Cursor-{{ cursor_version }}-x86_64.AppImage
    - require:
      - cmd: dev-cursor--install-cursor

dev-cursor--install-cursor-extension-directory:
  file.directory:
    - name: /home/user/cursor-extensions
    - user: user
    - group: user
    - mode: 755
    - makedirs: True
 
dev-cursor--install-cursor-extension-vim:
  cmd.run:
    - name: curl --tlsv1.3 -LO --output-dir "/home/user/cursor-extensions" "https://github.com/VSCodeVim/Vim/releases/download/v{{ vscode_vim_version }}/vim-{{ vscode_vim_version }}.vsix"
    - runas: user
    - unless: test -f /home/user/cursor-extensions/vim-{{ vscode_vim_version }}.vsix
    - require:
      - file: dev-cursor--install-cursor-extension-directory

{% elif grains['id'] == 'template-dev-cursor' %}

dev-cursor--create-desktop-entry:
  file.managed:
    - name: /usr/share/applications/cursor.desktop
    - contents: |
        [Desktop Entry]
        Name=Cursor
        Exec=/home/user/Cursor-{{ cursor_version }}-x86_64.AppImage
        Icon=cursor
        Terminal=false
        Type=Application
        Categories=Development
    - mode: 644

{% endif %}
