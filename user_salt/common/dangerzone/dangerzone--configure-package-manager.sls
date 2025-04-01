{% if grains['os'] == 'Fedora' and grains['id'] != 'dom0' %}

dangerzone--configure-package-manager:
  cmd.run:
    - name: |
        sudo dnf install 'dnf-command(config-manager)'
        sudo dnf-3 config-manager --add-repo=https://packages.freedom.press/yum-tools-prod/dangerzone/dangerzone.repo

{% elif grains['os'] == 'Debian' %}

dangerzone--install-prerequisites:
  pkg.installed:
    - refresh: True
    - pkgs:
      - qubes-core-agent-networking
      - gnupg2
      - ca-certificates

dangerzone--create-keyrings-dir:
  file.directory:
    - name: /etc/apt/keyrings
    - user: root
    - group: root
    - mode: 755
    - makedirs: True

dangerzone--download-gpg-key:
  cmd.run:
    - name: |
        all_proxy=http://127.0.0.1:8082 gpg --keyserver hkps://keys.openpgp.org \
                                            --no-default-keyring --keyring ./fpf-apt-tools-archive-keyring.gpg \
                                            --recv-keys "DE28 AB24 1FA4 8260 FAC9 B8BA A7C9 B385 2260 4281" && \
        mv fpf-apt-tools-archive-keyring.gpg /etc/apt/keyrings/fpf-apt-tools-archive-keyring.gpg
    - cwd: /tmp
    - creates: /etc/apt/keyrings/fpf-apt-tools-archive-keyring.gpg
    - require:
      - pkg: dangerzone--install-prerequisites
      - file: dangerzone--create-keyrings-dir

dangerzone--fpf-apt-repo:
  pkgrepo.managed:
    - name: deb [signed-by=/etc/apt/keyrings/fpf-apt-tools-archive-keyring.gpg] https://packages.freedom.press/apt-tools-prod {{ grains['oscodename'] }} main
    - humanname: Freedom of the Press Foundation Tools Repository Prod
    - file: /etc/apt/sources.list.d/fpf-apt-tools.list
    - refresh: True
    - require:
      - cmd: dangerzone--download-gpg-key

{% endif %}
