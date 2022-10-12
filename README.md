Docker Pi-hole + Unbound
========================

This repository combines the official [Pi-hole Docker image](https://github.com/pi-hole/docker-pi-hole) with [Unbound](https://nlnetlabs.nl/projects/unbound/about/).
All services run in the same single container.

Upgrade Notes
-------------

You should check the offical container [upgrade notes](https://github.com/pi-hole/docker-pi-hole#upgrade-notes) before any upgrades are done.

Currently there are no special notes for this repository.

Quick Start
-----------

0. Have a functional Pi-hole container running
1. Clone this repository and build the image
2. Change the Pi-hole image to the build one
3. Remove any environment variables modifying upstream servers
4. Restart/Recreate container
5. Check if change was successfull
   1. Sole upstream server `127.0.0.1#5335` selected in web interface
   2. DNS resolution works as intended; status is `NOERROR` and an IP address

      ```bash
      dig sigok.verteiltesysteme.net
      ```

   3. DNSSEC works as intended; status is `SERVFAIL` and no IP address

      ```bash
      dig sigfail.verteiltesysteme.net
      ```

Environment Variables
---------------------

The environment variables from the upstream container image are fully functional and [documented](https://github.com/pi-hole/docker-pi-hole#environment-variables).

### Changed Variables ###

| Variable | Default | Comment |
| -------- | ------- | ------- |
| `PIHOLE_DNS_` | `127.0.0.1#5335` | Do not modify/set this value because this controls wether the integrated Unbound resolver is used |
| `IPv6` | unchanged | This settings controls in addition to upstream wether Unbound can use IPv6 or not |

### Additional Variables ###

| Variable | Default | Value | Description |
| -------- | ------- | ----- | ----------- |
| `UNBOUND_PREFER_IPv6` | `false` | `<"true"\|"false">` | This settings controls if Unbound should prefer IPv6 over IPv4. Enable this **only** if you have a native IPv6 connection |

Related Work
------------

There are multiple other solutions available for this setup. The main points why I created this project are:

- Unbound with the configuration from the Pi-hole guide
- Options to enable and prefer IPv6. This can be usefull when your ISP uses [DS-Lite](https://en.wikipedia.org/wiki/IPv6_transition_mechanism#Dual-Stack_Lite_(DS-Lite)) or similar connection types (e.g., CG-NAT with IPv6)
- Unbound controlled by [s6-overlay](https://github.com/just-containers/s6-overlay) which is used by the upstream image
- Pi-hole updates without waiting for other developers

User Feedback
-------------

Feel free to open an issue when you suspect an issue with this project, e.g., the official image works.
