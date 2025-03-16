{% if grains['id'] == 'dom0' %}

onionize-repositories--dom0-repos:
  file.managed:
    - name: /etc/yum.repos.d/qubes-dom0.repo
    - source: salt://common/onionize-repositories/files/qubes-dom0.repo

{% endif %}
