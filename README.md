# Kimai Docker Image

This docker image entry-point sets up the kimai without using the installer. Configured by env variables to setup the database connection, enabling the configuration of Kimai in a cluster environment.

There is no need to run the installer after the image is started, also there is not installer anymore, it is already removed.

The Configuration is done in docker style, there need to be a second container running a database. 

## Variables

### KIMAI\_MYSQL\_HOSTNAME
This sets the hostname for the database

### KIMAI\_MYSQL\_DATABASE
The Databasename to setup e.q. kimai

### KIMAI\_MYSQL\_USERNAME
The database username

### KIMAI\_MYSQL\_PASSWORD
The password for the user

### KIMAI\_SALT
A salt for better password hashing in the db

The default password for the "admin" user ist "changeme"

## TODOs
Make the default "admin" password configurable 