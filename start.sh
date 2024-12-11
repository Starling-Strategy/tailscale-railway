#!/bin/sh

# Start Tailscaled with userspace networking
/usr/local/bin/tailscaled --tun=userspace-networking --socks5-server=localhost:1055 &

# Wait for tailscaled to start
until /usr/local/bin/tailscale up --authkey=${TAILSCALE_AUTHKEY} \
      --hostname=railway-exit-node \
      --advertise-exit-node; do
    sleep 0.1
done

# Keep the container running
sleep infinity