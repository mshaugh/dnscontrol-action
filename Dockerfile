FROM stackexchange/dnscontrol:4.17.0@sha256:6a696bbbc25ea16aea7077f6b03fe70b17b8d253056853e1de929a2870b06a80

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
