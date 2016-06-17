# lgmj-server (Linux, Glassfish, MySQL, JEE)

This machine provided by [*Vagrant*](https://www.vagrantup.com/) supports the following:

* Official Ubuntu Server 14.04 LTS (Trusty Tahr)
* Glassfish 4 Community Edition
* MySQL Server 5.5
* Oracle Java 8

## Important note
This machine is designed for development purposes and should not be used in production environments without
modification. No security features are enabled and some passwords are documented in this README.

## Configuration
### Glassfish 4
If you want to use Glassfish 4 with DAS, you have to enable SSL for the admin console on port 4848:
```
vagrant ssh
sudo /opt/glassfish4/glassfish/bin/asadmin change-admin-password
sudo /opt/glassfish4/glassfish/bin/asadmin enable-secure-admin
```

As old password for user *admin* provide an empty password and then enter the new password for accessing the admin console twice. 

Follow the instructions and restart the domain:
```
sudo /etc/init.d/glassfish restart
```

### MySQL 5.5
MySQL server is accessible from your host with credentials:
* Username: admin
* Password: admin

```
mysql -u admin --password
```

## Troubleshooting
This section covers general errors which can occur while using vagrant.

**Vagrant Not Starting Up. User that created VM doesn't match current user**

Delete the folder .vagrant and rebuild the machine by calling _vagrant up_.
