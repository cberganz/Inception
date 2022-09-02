if [ -f "/home/${FTP_USER}/wordpress/.init_ftp_done" ]; then
    echo "FTP initialization already done !"
else
    echo "FTP initialization not done !"
    echo "Starting FTP initialization..."

	mkdir -p /var/run/vsftpd/empty

	adduser --no-create-home --disabled-password --gecos "" ${FTP_USER} > /dev/null
	su - ${FTP_USER}
	echo "${FTP_USER}:${FTP_PWD}" | /usr/sbin/chpasswd

	mkdir -p "/home/$FTP_USER/wordpress"

	touch /var/log/vsftpd.log

	echo ${FTP_USER} > /etc/vsftpd.userlist

    echo "Initialization done successfully !"
    touch /home/${FTP_USER}/wordpress/.init_ftp_done

fi

echo "FTP started !"
/usr/sbin/vsftpd /etc/vsftpd.conf
