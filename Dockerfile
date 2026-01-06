FROM stackexchange/dnscontrol:4.28.2@sha256:8732023ce83498fbc1b1863eb1908d3e7cbf807d438d97f5b9317b1e1f38b0f2

LABEL repository="https://github.com/mshaugh/dnscontrol-action"
LABEL maintainer="Max Shaughnessy <mshaugh@hey.com>"

LABEL "com.github.actions.name"="DNSControl"
LABEL "com.github.actions.description"="Maintain your DNS data with DNSControl and GitHub Actions"
LABEL "com.github.actions.icon"="globe"
LABEL "com.github.actions.color"="blue"

RUN apk update && apk add --no-cache bash~=5

RUN ["dnscontrol", "version"]

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
