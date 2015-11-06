# Centos with the latest golang installed
# centos with the mysql-5.7 installed 

FROM sndnvaps/docker-golang:latest 
MAINTAINER sndnvaps sndnvaps@gmail.com

ENV PACKAGE_URL https://repo.mysql.com/yum/mysql-5.7-community/docker/x86_64/mysql-community-server-minimal-5.7.9-1.el7.x86_64.rpm

# Install server
RUN rpmkeys --import http://repo.mysql.com/RPM-GPG-KEY-mysql \
  && yum install -y $PACKAGE_URL \
  && rm -rf /var/cache/yum/*
RUN mkdir /docker-entrypoint-initdb.d

VOLUME /var/lib/mysql

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
RUN  go version 
EXPOSE 3306
CMD ["mysqld"]