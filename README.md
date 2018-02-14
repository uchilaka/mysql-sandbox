# MySQL Container for Wordpress `docker-wp-mysql`
Docker MySQL Server image configurations for docker wordpress stages

## Documentation
- Details about configuring this container: [https://hub.docker.com/_/mysql/]()
- Documentation on options files, in our case `./conf.d/my.cnf` can be found here: [https://dev.mysql.com/doc/refman/5.7/en/option-files.html]()

## Setup for Remote Access
In addition to the configuration entry for `bind-address` (see `./conf.d/my.cnf`) you also need to create a user with global privileges:
```
mysql> create user 'crud'@'%' identified by 'Y0urP3ssw0rd';
Query OK, 0 rows affected (0.04 sec)

mysql> grant all privileges on * . * to 'crud'@'%';
Query OK, 0 rows affected (0.00 sec)

mysql> FLUSH PRIVILEGES;
Query OK, 0 rows affected (0.01 sec)
```
You can access your container to complete this task by running the following command on your docker engine host:
```
docker exec -it <mysql-container-name> bash
```

## Timezone Settings
Complete more research for how to install timezone tables from resource files at this URL: [https://dev.mysql.com/downloads/timezones.html](). Files for `5.7` have been downloaded to `./res/timezone_2017c_leaps_sql.zip` (NON-POSIX, with leap seconds).

- **FYI** if your data directory in deployment already contains mysql files, those files will NOT be replaced (I believe this to be true as @ last check of the Docker source documentation for the docker repo src we are using)
