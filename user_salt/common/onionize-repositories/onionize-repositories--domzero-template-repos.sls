{% if grains['id'] == 'dom0' %}

onionize-repositories--domzero-template-repos:
  file.managed:
    - name: /etc/qubes/repo-templates/qubes-templates.repo
    - source: salt://common/onionize-repositories/files/qubes-templates.repo

{% endif %}
