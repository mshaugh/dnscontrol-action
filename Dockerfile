FROM stackexchange/dnscontrol:4.22.0@sha256:005fae8a4eae2bf370385d618a169f9d9fcdf1baf9e523f0a13582d4cbcfd273

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
