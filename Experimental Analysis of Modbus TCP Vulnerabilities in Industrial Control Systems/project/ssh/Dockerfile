FROM alpine:3.18
RUN apk add --no-cache openssh
RUN ssh-keygen -A
RUN echo "root:root" | chpasswd
CMD ["/usr/sbin/sshd", "-D"]
