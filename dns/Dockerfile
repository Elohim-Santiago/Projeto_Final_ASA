FROM ubuntu/bind9

RUN apt update

RUN apt upgrade -y

RUN apt install dnsutils -y

COPY ./dns/* /etc/bind

EXPOSE 53/tcp

EXPOSE 53/udp

EXPOSE 953/tcp