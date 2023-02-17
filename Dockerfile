FROM pihole/pihole:2023.02.2

RUN apt-get update && apt-get install -y unbound && rm -rf /var/cache/apt/archives /var/lib/apt/lists/*
RUN ! unbound-anchor -a "/var/lib/unbound/root.key"

COPY root /

ENV PREFER_IPv6=false
ENV PIHOLE_DNS_=127.0.0.1#5335
