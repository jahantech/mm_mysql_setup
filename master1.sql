create database example; 
CHANGE MASTER TO MASTER_HOST = '127.0.0.1', MASTER_USER = 'root', MASTER_LOG_FILE = 'mysql-bin.000001', MASTER_LOG_POS = 107, MASTER_PORT=3308; 
start slave; 
