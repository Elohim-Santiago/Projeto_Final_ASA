FROM ubuntu:20.04

RUN apt update

RUN apt-get install -y postfix dnsutils iputils-ping telnet dovecot-common dovecot-core dovecot-imapd dovecot-pop3d 

RUN apt-get install -y apache2 apache2-utils libapache2-mod-php php php-cli php-curl php-xml php-imap nano net-tools

RUN apt upgrade -y

COPY main.cf /etc/postfix/main.cf

COPY /dovecot/10-mail.conf /etc/dovecot/conf.d/10-mail.conf

COPY /dovecot/20-pop3.conf /etc/dovecot/conf.d/20-pop3.conf

COPY /dovecot/10-master.conf /etc/dovecot/conf.d/10-master.conf

COPY /dovecot/dovecot.conf /etc/dovecot/dovecot.conf


COPY startservice.sh /shell/startservice.sh

ENTRYPOINT [ "/shell/startservice.sh" ] 