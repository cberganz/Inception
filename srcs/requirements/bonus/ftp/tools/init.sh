if [ ! -d "/var/run/vsftpd/empty" ]; then
	mkdir -p /var/run/vsftpd/empty
fi

if id ${FTP_USER} > /dev/null 2>&1; then
	su - ${FTP_USER}
else
	echo "Creating user..."
	adduser --no-create-home --disabled-password --gecos "" ${FTP_USER} > /dev/null
	su - ${FTP_USER}
	echo "${FTP_USER}:${FTP_PWD}" | /usr/sbin/chpasswd
fi

if [ ! -d "/home/${FTP_USER}/wordpress" ]; then
	mkdir -p "/home/${FTP_USER}/wordpress"
fi

if [ ! -f "/var/log/vsftpd.log" ]; then
	touch /var/log/vsftpd.log
fi

if [ ! -f "/etc/vsftpd.userlist" ] || ! (grep -q ${FTP_USER} "/etc/vsftpd.userlist"); then
	echo ${FTP_USER} > /etc/vsftpd.userlist
fi

echo "FTP started !"
/usr/sbin/vsftpd /etc/vsftpd.conf
