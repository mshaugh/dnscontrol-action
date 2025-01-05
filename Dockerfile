FROM stackexchange/dnscontrol:4.14.1@sha256:c6985b9c357744b1946e08e030ae7d8d1f3c7b4f190034d9d0bb24d5c95e3d28

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
