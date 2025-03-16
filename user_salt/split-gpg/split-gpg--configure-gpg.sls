{% if grains['id'] not in ['dom0', 'template-split-gpg', 'app-split-gpg'] %}

split-gpg--configure-gpg-import-files:
  file.managed:
    - mode: 644
    - names:
      - /tmp/public-keys-export:
        - source: salt://split-gpg/files/public-keys-export
      - /tmp/ownertrust-export:
        - source: salt://split-gpg/files/ownertrust-export

split-gpg--configure-public-keys-import:
  cmd.run:
    - name: "su - user -c 'gpg --import /tmp/public-keys-export'"
    - require:
      - file: split-gpg--configure-gpg-import-files

split-gpg--configure-ownertrust-import:
  cmd.run:
    - name: "su - user -c 'gpg --import-ownertrust /tmp/ownertrust-export'"
    - require:
      - file: split-gpg--configure-gpg-import-files

{% endif %}
