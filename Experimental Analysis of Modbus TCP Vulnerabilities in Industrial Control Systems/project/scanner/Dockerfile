FROM ubuntu:22.04

RUN apt update && \
    apt install -y nmap iputils-ping python3 tcpdump && \
    apt install -y grassmarlin || true

COPY scan.sh /scan.sh
RUN chmod +x /scan.sh

CMD ["bash"]
