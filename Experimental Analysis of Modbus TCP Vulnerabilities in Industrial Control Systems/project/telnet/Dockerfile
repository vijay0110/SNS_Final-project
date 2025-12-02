FROM alpine:3.18
RUN apk add --no-cache busybox-extras
RUN adduser -D admin && echo "admin:admin" | chpasswd
CMD ["telnetd", "-F"]
