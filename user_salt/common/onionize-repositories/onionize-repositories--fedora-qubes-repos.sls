{% if grains['id'] != 'dom0' and grains['os'] == 'Fedora' %}

onionize-repositories--fedora-qubes-repos:
  file.managed: 
    - name: /etc/yum.repos.d/qubes-r4.repo
    - source: salt://common/onionize-repositories/files/fedora-qubes-r4.repo
    - user: root
    - group: root
    - mode: 600

{% endif %}
