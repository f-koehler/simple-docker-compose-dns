# Simple DNS server using docker-compose and dnsmasq

This repository showcases how you can easily set up a simple DNS server using  `dnsmasq` and `docker-compose`/`docker`.
DNS entries can be added directly via the `docker-compose.yml` file, which can be easily automated (e.g. via ansible).

Such a simple DNS server is ideal for internal use (e.g. at home or within a wireguard/tailscale VPN network).

## Option 1 - `docker-compose`

Change the DNS entries in the `extra_hosts` section in `docker-compose.yml`. The DNS server can be started by running

```bash
docker-compose up -d
```

from the project directory.

By default, the DNS server will listen all IP addresses/interfaces (equivalent to `0.0.0.0`). This can be changed in the `ports` section by changing `53:53/tcp` to `<IP address>:53:53/tcp` etc.

The server can be stopped by running

```bash
docker-compose down
```

from the project directory.

`dnsmasq` can be configured by modifying the `dnsmasq.conf` file. After changing this file, it is necessary to first bring the server down and restart using the aforementioned commands.

## Option 2 - Plain `docker`

The server can be run with plain `docker` commands as well. First, the docker image is built using

```bash
docker build -t simple-docker-dns .
```

and then started with

```bash
docker run -d --name dns_service \
  --restart unless-stopped \
  -v /etc/localtime:/etc/localtime:ro \
  -v $(pwd)/dnsmasq.conf:/etc/dnsmasq.conf:ro \
  -p 53:53/tcp \
  -p 53:53/udp \
  --add-host foo.bar:192.168.0.1 \
  simple-docker-dns
```

The DNS entries are specified using `--add-host <entry>`.

The server can subequently be stopped using

```bash
docker stop simple-docker-dns
```

`dnsmasq` can be configured by modifying the `dnsmasq.conf` file. After changing this file, it is necessary to first bring the server down, rebuild the docker image and finally start it again.
