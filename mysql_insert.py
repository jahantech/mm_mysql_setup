import MySQLdb

for row in range (1, 1000):
   conn = MySQLdb.connect(host= "172.17.0.33",user="root",db="example")
   x = conn.cursor()
   print "Inserting Value"    
   x.execute("INSERT INTO comments (name,comment) VALUES (\"JahanS\",\"%d\")" % row)
   conn.commit()
   conn.close()
