{% if grains['id'] != 'dom0' %}

dangerzone--install-packages:
  pkg.installed:
    - refresh: True
    - pkgs:
      - qubes-core-agent-networking
      - dangerzone
  {% if grains['os'] == 'Fedora' %}
    - require:
      - cmd: dangerzone--configure-package-manager
  {% endif %}
  {% if grains['os'] == 'Debian' %}
    - require:
      - pkgrepo: dangerzone--fpf-apt-repo
  {% endif %}

{% endif %}
