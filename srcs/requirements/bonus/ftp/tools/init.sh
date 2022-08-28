if [ -f ".init_done" ]; then
    echo "FTP initialization already done !"
else
    echo "FTP initialization not done !"
    echo "Starting FTP initialization..."

	mkdir -p  /var/run/vsftpd/empty

	adduser --disabled-password --gecos "" ${FTP_USER}
	echo "${FTP_USER}:${FTP_PWD}" | /usr/sbin/chpasswd

	chmod ug-w "/home/$FTP_USER"
	mkdir -p "/home/$FTP_USER/wordpress"
	chown -R "$FTP_USER:$FTP_USER" "/home/$FTP_USER/wordpress"
	chmod ug+rw "/home/$FTP_USER/wordpress"

	touch /var/log/vsftpd.log

	echo ${FTP_USER} > /etc/vsftpd.userlist

    echo "Initialization done successfully !"
    touch .init_done

fi

echo "FTP started !"
/usr/sbin/vsftpd /etc/vsftpd.conf
