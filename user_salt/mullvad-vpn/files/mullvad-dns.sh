#! /usr/bin/env bash

update_dns() {
	# mullvad_on: 0 -> off, 1 -> on
	mullvad_on=$([[ $(grep -v -c "nameserver \+10.139" /etc/resolv.conf) -gt 0 ]] && echo 1 || echo 0)

	if [[ $mullvad_on -eq 1 ]]; then

		echo "Mullvad is on"

		# get the mullvad dns ip address. First one is used if there is more than one.
		mullvad_dns_ip=$(grep "nameserver" < /etc/resolv.conf| awk '{print $2}' | head -n 1)

		# delete all the lines defined in dnat-dns
		sudo nft flush chain ip qubes dnat-dns

		# forward all dns requests to mullvad dns servers
		sudo nft add rule ip qubes dnat-dns meta l4proto { tcp, udp } ip daddr { 10.139.1.1, 10.139.1.2 } th dport 53 dnat to "$mullvad_dns_ip"

	else

		echo "Mullvad is off"

		# get qubes nameserver ip addresses
		nameserver_ips=$(grep "nameserver" < /etc/resolv.conf| awk '{print $2}')

		# delete all the lines defined in dnat-dns
		sudo nft flush chain ip qubes dnat-dns

		# add rule to forward dns requests to qubes nameservers
		for ip in $nameserver_ips; do
			sudo nft add rule ip qubes dnat-dns ip daddr "$ip" udp dport 53 dnat to "$ip"
			sudo nft add rule ip qubes dnat-dns ip daddr "$ip" tcp dport 53 dnat to "$ip"
		done

	fi
}

update_dns
# check for /etc/resolv.conf content change
inotifywait -m -q -e close_write /etc/resolv.conf | while read -r;
do
	update_dns
done
