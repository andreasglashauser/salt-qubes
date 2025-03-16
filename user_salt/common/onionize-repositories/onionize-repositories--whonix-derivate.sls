{% if 'whonix' in grains['id'] %}

onionize-repositories--whonix-derivative:
  cmd.run:
    - name: repository-dist --enable --transport onion 

{% endif %}
