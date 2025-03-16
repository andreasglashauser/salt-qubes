{% if grains['id'] == 'dom0' %}

sys-audio--configure-policy:
  file.managed:
    - name: /etc/qubes/policy.d/50-sys-audio.policy
    - source: salt://sys-audio/files/50-sys-audio.policy

{% endif %}
