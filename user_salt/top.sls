{% import "templates/versions.jinja" as version %}

# vim: set syntax=yaml ts=2 sw=2 sts=2 et :
#
# 1) Intial Setup: sync any modules, etc
# --> qubesctl saltutil.sync_all
#
# 2) Initial Key Import:
# --> qubesctl state.sls salt.gnupg
#
# 3) Highstate will execute all states
# --> qubesctl state.highstate
#
# 4) Highstate test mode only.  Note note all states seem to conform to test
#    mode and may apply state anyway.  Needs more testing to confirm or not!
# --> qubesctl state.highstate test=True

# === User Defined Salt States ================================================
#user:
#  '*':
#    - locale

#user:
 # '*':
 #   - top.sls 
  
user:
  '*':
    - common.journald
    - common.darkmode
    - common.bash
    - common.onionize-repositories

  dom0:
    - common.disk-trimming
    - common.logrotate
    - common.remove-unwanted.remove-unwanted--domzero-packages
  
  debian-{{ version.debian }}-minimal:
    - common.remove-unwanted.remove-unwanted--debian-packages

  fedora-{{ version.fedora }}-minimal:
    - common.onionize-repositories

  whonix-gateway-{{ version.whonix }}:
    - common.kernel.kernel--disable-sound

  whonix-workstation-{{ version.whonix }}:
    - common.kernel.kernel--disable-sound

  dom0 or template-firewall:
    - sys-firewall
    - common.kernel.kernel--disable-sound

  dom0 or template-audio:
    - sys-audio
    - common.remove-unwanted.remove-unwanted--debian-systemd-services
  
  dom0 or whonix-workstation-{{ version.whonix }}-dvm:
    - whonix-workstation-dvm

  dom0 or template-usb:
    - sys-usb
    - common.kernel.kernel--disable-sound
    - common.remove-unwanted.remove-unwanted--debian-systemd-services

  dom0 or template-net:
    - sys-net
    - common.kernel.kernel--disable-sound

  dom0 or template-default-mgmt-dvm:
    - default-mgmt-dvm
    - common.kernel.kernel--disable-sound
    - common.remove-unwanted.remove-unwanted--debian-systemd-services

  dom0 or template-vpn-mullvad or app-vpn-mullvad or template-vpn-mullvad-for-tor or app-vpn-mullvad-for-tor:
    - mullvad-vpn
    - common.kernel.kernel--disable-sound

  dom0 or template-default-dvm:
    - default-dvm
    - common.kernel.kernel--disable-sound
    - common.remove-unwanted.remove-unwanted--debian-systemd-services

  dom0 or template-pwmanager:
    - pwmanager
    - common.kernel.kernel--disable-sound
    - common.remove-unwanted.remove-unwanted--debian-systemd-services

  dom0 or template-archive:
    - archive
    - common.kernel.kernel--disable-sound
    - common.remove-unwanted.remove-unwanted--debian-systemd-services

  dom0 or template-notes:
    - notes
    - common.kernel.kernel--disable-sound
    - common.remove-unwanted.remove-unwanted--debian-systemd-services

  dom0 or template-mullvad-browser:
    - mullvad-browser

  dom0 or template-dev:
    - dev
    - common.kernel.kernel--disable-sound

  dom0 or template-ssh or template-split-ssh or app-ssh or app-split-ssh:
    - split-ssh
    - common.kernel.kernel--disable-sound

  dom0 or template-split-ssh:
    - common.remove-unwanted.remove-unwanted--debian-systemd-services

  dom0 or template-btc or template-btc-offline:
    - split-btc
    - common.kernel.kernel--disable-sound

  dom0 or template-btc-offline:
    - common.remove-unwanted.remove-unwanted--debian-systemd-services

  dom0 or template-split-gpg:
    - split-gpg
    - common.kernel.kernel--disable-sound
    - common.remove-unwanted.remove-unwanted--debian-systemd-services

  dom0 or template-split-gpg-legacy:
    - split-gpg-legacy
    - common.kernel.kernel--disable-sound
    - common.remove-unwanted.remove-unwanted--debian-systemd-services

  dom0 or sys-whonix:
    - sys-whonix
    - common.kernel.kernel--disable-sound
  
  dom0 or template-llm or q-llm:
    - llm
