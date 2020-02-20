#!/usr/bin/env bash

# Supress interactive 
export DEBIAN_FRONTEND=noninteractive

# *****************************************************************************
#	Preapring APT repositories
# *****************************************************************************
# Add repository for Open JDK
add-apt-repository ppa:openjdk-r/ppa -y
apt-get update -y

# *****************************************************************************
#	Install system components
# *****************************************************************************
# Install Java 8
apt-get install openjdk-8-jdk -y

# Set MySQL password and install MySQL Server
apt-get install mysql-client mysql-server mysql-server-5.5 mysql-client-5.5 -y -f

# Install unzip
apt-get install unzip -y -f

# *****************************************************************************
#	Prepare Glassfish 4 installation including Domain and automatic startup
# *****************************************************************************
# Install Glassfish 4.1.2
if ! [ -e /opt/glassfish4 ]; then
	echo "Going to install Glassfish 4.1.2..."
	wget http://download.java.net/glassfish/4.1.2/release/glassfish-4.1.2.zip 
	unzip glassfish-4.1.2.zip -d /opt
	rm glassfish-4.1.2.zip
fi

# Register automatic startup script if exists
if ! [ -e /etc/init.d/glassfish ]; then
	echo "Copying startup script..."
	cp -f /home/vagrant/glassfish /etc/init.d/glassfish
	chmod +x /etc/init.d/glassfish
	update-rc.d glassfish defaults
	/etc/init.d/glassfish start
fi

# *****************************************************************************
#	Configure MySQL for external listening
# *****************************************************************************
echo "Configure MySQL..."
if ! [ -e /etc/mysql/my.bak ]; then
	/etc/init.d/mysql stop
	cp /etc/mysql/my.cnf /etc/mysql/my.bak
	sed -i s/127.0.0.1/0.0.0.0/g /etc/mysql/my.cnf
	/etc/init.d/mysql start
	mysql -e "CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';GRANT ALL PRIVILEGES ON * . * TO 'admin'@'%';FLUSH PRIVILEGES;" -u root
fi


