{% import "templates/versions.jinja" as version %}

{% if grains['id'] == 'dom0' %}

templates--install-whonix-gw-{{ version.whonix }}: 
  qvm.template_installed: 
    - name: whonix-gateway-{{ version.whonix }} 
    - fromrepo: qubes-templates-itl 
 
templates--whonix-gw-{{ version.whonix }}-prefs: 
  qvm.prefs: 
     - name: whonix-gateway-{{ version.whonix }} 
     - audiovm: 
     - guivm: 
     - netvm: 

{% endif %}
