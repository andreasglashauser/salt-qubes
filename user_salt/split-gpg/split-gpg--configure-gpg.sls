{% if grains['id'] not in ['dom0', 'template-split-gpg', 'app-split-gpg'] %}
{% set gpg_fingerprint = 'C1E78CE601392ABCC49072A0B204131BB15B20FE' %}


split-gpg--configure-cache-dir:
  file.directory:
    - name: /home/user/.cache
    - user: user
    - group: user
    - mode: 755
    - makedirs: True

split-gpg--configure-gpg-import-files:
  file.managed:
    - mode: 644
    - names:
      - /home/user/.cache/public-keys-export:
        - source: salt://split-gpg/files/public-keys-export
      - /home/user/.cache/ownertrust-export:
        - source: salt://split-gpg/files/ownertrust-export
    - require: 
      - file: split-gpg--configure-cache-dir

split-gpg--configure-public-keys-import:
  cmd.run:
    - name: "su - user -c 'gpg --import /home/user/.cache/public-keys-export'"
    - require:
      - file: split-gpg--configure-gpg-import-files
    - unless: su - user -c 'gpg --list-keys | grep -q {{ gpg_fingerprint }}'

split-gpg--configure-ownertrust-import:
  cmd.run:
    - name: "su - user -c 'gpg --import-ownertrust /home/user/.cache/ownertrust-export'"
    - runas: user
    - require:
      - file: split-gpg--configure-gpg-import-files
    - unless: |
        # Compare SHA256 hashes of current trust vs export file
        CURRENT_HASH=$(su - user -c 'gpg --export-ownertrust | grep {{ gpg_fingerprint }} | sha256sum')
        DESIRED_HASH=$(cat /home/user/.cache/ownertrust-export | grep {{ gpg_fingerprint }} | sha256sum)
        [ "$CURRENT_HASH" = "$DESIRED_HASH" ]

{% endif %}
