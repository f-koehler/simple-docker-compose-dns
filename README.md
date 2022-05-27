# Simple DNS server using docker-compose and dnsmasq

This repository showcases how you can easily set up a DNS server using `docker-compose` and `dnsmasq`.
DNS entries can be added directly via the `docker-compose.yml` file, which can be easily automated (e.g. via ansible).

Such a simple DNS server is ideal for internal use (e.g. at home or within a wireguard/tailscale VPN network).

## Running

Running is as simple as executing the command

```bash
docker-compose up -d
```

from the project directory.
`dnsmasq` can be configured using the `dnsmasq.conf` file.

The DNS server will start listening at port 53 (the default for DNS).
The DNS server can be easily stopped/removed by running

```bash
docker-compose down
```

from the project directory.
