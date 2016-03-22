create user 'replicator'@'%' ;
grant replication slave on *.* to 'replicator'@'%'; 
flush privileges;
create database example; 
CHANGE MASTER TO MASTER_HOST = '127.0.0.1', MASTER_USER = 'replicator', MASTER_LOG_FILE = 'mysql-bin.000001', MASTER_LOG_POS = 107, MASTER_PORT=3308; 
slave start;  
