{% if grains['id'] == 'template-element' %}

element--gpg-key:
  file.managed:
    - name: /usr/share/keyrings/element-io-archive-keyring.gpg
    - source: salt://element/files/element-io-archive-keyring.gpg
    - user: root
    - group: root
    - mode: 644

element--apt-repo:
  pkgrepo.managed:
    - name: deb [arch=amd64 signed-by=/usr/share/keyrings/element-io-archive-keyring.gpg] https://packages.element.io/debian default main
    - humanname: Element Repository
    - file: /etc/apt/sources.list.d/element-io.list
    - refresh: True
    - require:
      - file: element--gpg-key

{% endif %}
