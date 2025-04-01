darkmode--configure-profile:
  file.managed:
    - name: /etc/profile.d/darkmode.sh
    - contents: |
        #!/bin/bash
        export QT_QPA_PLATFORMTHEME=gtk2
        export QT_STYLE_OVERRIDE=Adwaita-dark
        export GTK_THEME=Adwaita:dark
    - user: root
    - group: root
    - mode: 755

darkmode--ensure-environment-file-exists:
  file.managed:
    - name: /etc/environment
    - user: root
    - group: root
    - mode: 644
    - create: True
    - replace: False

darkmode--configure-environment:
  file.blockreplace:
    - name: /etc/environment
    - marker_start: "# {mark} QT THEME SETTING (SALT) - START"
    - marker_end: "# {mark} QT THEME SETTING (SALT) - END"
    - content: |
        QT_QPA_PLATFORMTHEME=gtk2
    - append_if_not_found: True
    - show_changes: True
    - require:
      - file: darkmode--ensure-environment-file-exists
