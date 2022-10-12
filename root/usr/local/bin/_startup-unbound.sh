#!/bin/bash -e

if [ "${PH_VERBOSE:-0}" -gt 0 ]; then
	set -x
fi

if [ "${IPv6,,}" = "true" ]; then
	sed -i -e '/do-ip6:/ s/: .*/: yes/' /etc/unbound/unbound.conf.d/pi-hole.conf
	if [ "${UNBOUND_PREFER_IPv6,,}" = "true" ]; then
		sed -i -e '/prefer-ip6:/ s/: .*/: yes/' /etc/unbound/unbound.conf.d/pi-hole.conf
	else
		sed -i -e '/prefer-ip6:/ s/: .*/: no/' /etc/unbound/unbound.conf.d/pi-hole.conf
	fi
else
	sed -i -e '/do-ip6:/ s/: .*/: no/' /etc/unbound/unbound.conf.d/pi-hole.conf
	sed -i -e '/prefer-ip6:/ s/: .*/: no/' /etc/unbound/unbound.conf.d/pi-hole.conf
fi
