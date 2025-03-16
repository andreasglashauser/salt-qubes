{% if grains['id'] == 'template-split-ssh' %}

split-ssh--install-template-split-ssh:
  pkg.installed:
    - refresh: True
    - pkgs:
      - qubes-app-shutdown-idle
      - ssh-askpass-gnome
      - socat
      - libnotify-bin

{% elif grains['id'] == 'template-ssh' %}

split-ssh--install-packages-template-ssh:
  pkg.installed:
    - refresh: True
    - pkgs:
      - qubes-core-agent-networking
      - split-gpg2
      - openssh-client
      - knockd
      - salt-ssh
      - git

{% endif %}
