{% if grains['id'] == 'dom0' %}

split-gpg--configure-policy:
  file.managed:
    - name: /etc/qubes/policy.d/30-user-gpg2.policy
    - source: salt://split-gpg/files/30-user-gpg2.policy

{% endif %}
