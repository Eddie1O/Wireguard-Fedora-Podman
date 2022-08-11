docker run -d \
  --name=homeguard \
  --cap-add=NET_ADMIN,,NET_RAW \
  --cap-add=SYS_MODULE \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/Berlin \
  -e SERVERURL=<#PublicIP#> `#optional` \
  -e SERVERPORT=51820 `#optional` \
  -e PEERS=2 `#optional` \
  -e PEERDNS=auto `#optional` \
  -e INTERNAL_SUBNET=10.13.13.0 `#optional` \
  -e ALLOWEDIPS=0.0.0.0/0 `#optional` \
  -e LOG_CONFS=true `#optional` \
  -p 51820:51820/udp \
  -v /opt/wireguard/config:/config:z \
  -v /lib/modules:/lib/modules:z \
  --sysctl="net.ipv4.conf.all.src_valid_mark=1" \
  --restart unless-stopped \
  linuxserver/wireguard
