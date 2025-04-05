{% if grains['id'] == 'template-signal' %}

signal--create-keyrings-dir:
  file.directory:
    - name: /etc/apt/keyrings
    - user: root
    - group: root
    - mode: 755
    - makedirs: True

signal--gpg-key:
  file.managed:
    - name: /usr/share/keyrings/signal-desktop-keyring.gpg
    - source: salt://signal/files/signal-desktop-keyring.gpg
    - user: root
    - group: root
    - mode: 644
    - require:
      - file: signal--create-keyrings-dir

signal--apt-repo:
  pkgrepo.managed:
    - name: deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main
    - humanname: Signal Repository
    - file: /etc/apt/sources.list.d/signal-xenial.list
    - refresh: True
    - require:
      - cmd: dangerzone--download-gpg-key
    - require:
      - file: signal--gpg-key

{% endif %}
