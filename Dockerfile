FROM centos:6.6

MAINTAINER Jahan Syed
## Reason for choosing centos 6.6 is that I want to utilise init.d to create multiple services in container without the need of supervisord 
RUN yum install mysql-server mysql mysql-devel haproxy -y
RUN mkdir -p /home/master1
RUN mkdir -p /home/master2
RUN chown mysql. /home/master1
RUN chown mysql. /home/master2
RUN mysql_install_db --datadir=/home/master1
RUN mysql_install_db --datadir=/home/master2
ADD my.cnf /etc/my.cnf
#Start mysql instance
RUN mysqld_multi start 1
RUN mysqld_multi start 2
ADD master1.sql /tmp/master1.sql
ADD master2.sql /tmp/master2.sql
ADD haproxy.cfg /etc/haproxy/haproxy.cfg
RUN service haproxy start
