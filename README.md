# Master-to-Master MySQL replication and a webpage for demo of the setup.

## Setup
Clone this repository to your machine: 
```
git clone https://github.com/jahantech/mm_mysql_setup.git
```
Go to mm_mysql_setup folder and run 
```
docker build .
docker run -ti IMAGE_NAME
```
You will be able to log into mysql master instances instance via:
```
mysql --socket=/tmp/master1.sock
mysql --socket=/tmp/master2.sock
```
You should be able to create tables/databases and see them replicate on both other master instantly.
## Demo
WIP 
## References
MySQL Multi Instance Config: http://dev.mysql.com/doc/refman/5.7/en/mysqld-multi.html


