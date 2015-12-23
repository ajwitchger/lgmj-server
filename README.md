# lgmj-server (Linux, Glassfish, MySQL, JEE)

This machine provided by [*Vagrant*](https://www.vagrantup.com/) supports the following:

* Official Ubuntu Server 14.04 LTS (Trusty Tahr)
* Glassfish 4 Community Edition
* MySQL Server 5.5
* Oracle Java 7

## Important note
This machine is designed for development purposes and should not be used in production environments without
modification.

## Configuration
### Glassfish 4
If you want to use Glassfish 4 with DAS, you have to enable SSL for the admin console on port 4848:
```
*vagrant ssh*
vagrant@vagrant-ubuntu-trusty-64:~$ *sudo /opt/glassfish4/glassfish/bin/asadmin change-admin-password*
Enter admin user name [default: admin]>
Enter the admin password>
Enter the new admin password>
Enter the new admin password again>
Command change-admin-password executed successfully.
vagrant@vagrant-ubuntu-trusty-64:~$ *sudo /opt/glassfish4/glassfish/bin/asadmin enable-secure-admin*
Enter admin user name>  admin
Enter admin password for user "admin">
You must restart all running servers for the change in secure admin to take effect.
Command enable-secure-admin executed successfully.
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
