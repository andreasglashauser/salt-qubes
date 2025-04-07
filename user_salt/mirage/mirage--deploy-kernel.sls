{% if grains['id'] == 'dom0' %}

mirage--create-dir:
  file.directory:
    - name: /var/lib/qubes/vm-kernels/mirage-firewall
    - user: root
    - group: root
    - mode: 755
    - createdirs: True

mirage--copy:
  file.managed:
    - name: /var/lib/qubes/vm-kernels/mirage-firewall/vmlinuz
    - source: salt://mirage/files/qubes-firewall.xen
    - user: root
    - group: root
    - mode: 644

{% endif %}
