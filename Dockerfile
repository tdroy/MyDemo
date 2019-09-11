FROM centos

MAINTAINER troy.roy@oracle.com

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O https://archive.apache.org/dist/tomcat/tomcat-8/v8.0.32/bin/apache-tomcat-8.0.32.tar.gz
RUN tar -xvzf apache*.tar.gz
RUN mv apache-tomcat-8.0.32/* /opt/tomcat/.
RUN yum -y install java
RUN java -version

WORKDIR /opt/tomcat/webapps
COPY SessionReplication.war /opt/tomcat/webapps

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
