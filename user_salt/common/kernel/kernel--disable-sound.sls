{% if grains['id'] != 'dom0' %}

kernel--modprobe-blacklistconf-exists:
  file.managed:
    - name: /etc/modprobe.d/blacklist.conf
    - user: root
    - group: root
    - mode: 644
    - create: True
    - makedirs: True
    - replace: False

kernel--blacklist-sound-modules:
  file.blockreplace:
    - name: /etc/modprobe.d/blacklist.conf
    - marker_start: "# {mark} MANAGED BY SALT - START"
    - marker_end: "# {mark} MANAGED BY SALT - END"
    - content: |
        blacklist snd
        blacklist snd_timer
        blacklist snd_seq_device
        blacklist snd_seq
        blacklist snd_hrtimer
        blacklist snd_seq_dummy
        blacklist snd_pcm
        blacklist soundcore
        blacklist pcspkr
        blacklist snd_pcsp
    - append_if_not_found: True
    - show_changes: True
    - require:
      - kernel--modprobe-blacklistconf-exists

{% endif %}
