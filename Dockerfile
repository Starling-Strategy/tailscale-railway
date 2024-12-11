# Use Alpine Linux as the base image
FROM alpine:latest

# Install necessary packages
RUN apk update && apk add --no-cache \
    ca-certificates \
    iptables \
    ip6tables \
    curl

# Install Tailscale
RUN mkdir -p /usr/local/bin
RUN curl -fsSL https://pkgs.tailscale.com/stable/tailscale_1.74.1_amd64.tgz | \
    tar xzf - --strip-components=1 -C /usr/local/bin

# Copy the start script
COPY start.sh /app/start.sh

# Ensure start.sh has execute permissions
RUN chmod +x /app/start.sh

# Expose necessary ports (if any)
# EXPOSE 80 443

# Start the Tailscale service
CMD ["/app/start.sh"]