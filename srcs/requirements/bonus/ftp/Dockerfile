FROM    debian:10.12

RUN     apt-get -y update \
		&& apt-get -y vsftpd openssl

ARG     WWW_DIR
ARG     FTP_USER

RUN     mkdir -p ${WWW_DIR}

#COPY    ./conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

COPY    ./conf/setup.sh /setup.sh

RUN     adduser -D -h ${WP_DIR} ${FTP_USER} \
        && chown -R ${FTP_USER}:${FTP_USER} ${WP_DIR} 

EXPOSE  21

CMD     [ "sh" , "setup.sh" ]
