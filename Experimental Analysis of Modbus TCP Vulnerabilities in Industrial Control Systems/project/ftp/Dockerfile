FROM alpine:3.18

RUN apk add --no-cache pure-ftpd
RUN adduser -D admin && echo "admin:admin" | chpasswd

CMD ["pure-ftpd", "-E", "-j", "-P", "localhost"]
