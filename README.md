# Master-to-Master MySQL replication and a python script for demo.

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
Once the docker instances are created, make sure haproxy is running and mysql instances are running:
```
mysqld_multi report
mysqld_multi start
```
Run python mysql script in the project and monitor the stats on http://localhost:8080/stats page.

Key thing to note here is that, master master replication will not work without you setting the offset values per master. Because if you don't set offset for autoincrements (your primary keys) they will clash and replication will stop. The reason of clash is simple, your haproxy will try to send records to same table on same master at the same time and hence both masters will try to commit transaction with same autoincrement id, which will definitely break your replication. To avoid that set offset value in the config. View my.cnf file for details.
## References
MySQL Multi Instance Config: http://dev.mysql.com/doc/refman/5.7/en/mysqld-multi.html


