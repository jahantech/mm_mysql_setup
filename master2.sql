create user 'replicator'@'%' identified by 'password';
grant replication slave on *.* to 'replicator'@'%'; 
flush privileges;
create database example; 
slave stop; 
CHANGE MASTER TO MASTER_HOST = '127.0.0.1', MASTER_USER = 'replicator', MASTER_PASSWORD = 'password', MASTER_LOG_FILE = 'mysql-bin.000001', MASTER_LOG_POS = 107, MASTER_PORT=3307; 
slave start;  
