FROM alpine:latest

RUN apk add --no-cache dnsmasq

EXPOSE 53

ENTRYPOINT [ "/usr/sbin/dnsmasq" ]
CMD [ "-k" ]