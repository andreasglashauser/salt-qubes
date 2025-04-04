{% if grains['id'] != 'dom0' and grains['os'] == 'Fedora' %}

onionize-repositories--fedora-qubes-repos:
  file.managed: 
    - name: /etc/yum.repos.d/qubes-r4.repo
    - contents: |
        [qubes-vm-r4.2-current]
        name = Qubes OS Repository for VM (updates)
        #baseurl = https://yum.qubes-os.org/r4.2/current/vm/fc$releasever
        baseurl = http://yum.qubesosfasa4zl44o4tws22di6kepyzfeqv3tg4e3ztknltfxqrymdad.onion/r4.2/current/vm/fc$releasever
        gpgkey = file:///etc/pki/rpm-gpg/RPM-GPG-KEY-qubes-4.2-primary
        skip_if_unavailable=False
        gpgcheck = 1
        repo_gpgcheck = 1
        enabled=1
        
        [qubes-vm-r4.2-current-testing]
        name = Qubes OS Repository for VM (updates-testing)
        #baseurl = https://yum.qubes-os.org/r4.2/current-testing/vm/fc$releasever
        baseurl = http://yum.qubesosfasa4zl44o4tws22di6kepyzfeqv3tg4e3ztknltfxqrymdad.onion/r4.2/current-testing/vm/fc$releasever
        gpgkey = file:///etc/pki/rpm-gpg/RPM-GPG-KEY-qubes-4.2-primary
        skip_if_unavailable=False
        gpgcheck = 1
        repo_gpgcheck = 1
        enabled=0
        
        [qubes-vm-r4.2-security-testing]
        name = Qubes OS Repository for VM (security-testing)
        #baseurl = https://yum.qubes-os.org/r4.2/security-testing/vm/fc$releasever
        baseurl = http://yum.qubesosfasa4zl44o4tws22di6kepyzfeqv3tg4e3ztknltfxqrymdad.onion/r4.2/security-testing/vm/fc$releasever
        gpgkey = file:///etc/pki/rpm-gpg/RPM-GPG-KEY-qubes-4.2-primary
        skip_if_unavailable=False
        gpgcheck = 1
        repo_gpgcheck = 1
        enabled=0
        
        [qubes-vm-r4.2-unstable]
        name = Qubes OS Repository for VM (unstable)
        #baseurl = https://yum.qubes-os.org/r4.2/unstable/vm/fc$releasever
        baseurl = http://yum.qubesosfasa4zl44o4tws22di6kepyzfeqv3tg4e3ztknltfxqrymdad.onion/r4.2/unstable/vm/fc$releasever
        gpgkey = file:///etc/pki/rpm-gpg/RPM-GPG-KEY-qubes-4.2-unstable
        gpgcheck = 1
        repo_gpgcheck = 1
        enabled=0
    - user: root
    - group: root
    - mode: 600

{% endif %}
