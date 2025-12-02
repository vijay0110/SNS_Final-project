FROM alpine
RUN apk add --no-cache openssh && ssh-keygen -A
CMD ["/usr/sbin/sshd", "-D"]
