FROM stackexchange/dnscontrol:4.13.0@sha256:ca0813c7b679cf9ade0ba791427c2fb44d70b11dcf16541e9fad2c3910fc7f09

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
