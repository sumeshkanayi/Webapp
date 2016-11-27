FROM nexus:8084/ubuntu:14.04
MAINTAINER sumeshkanayi@gmail.com
RUN apt-get -y update
RUN apt-get -y install default-jdk tomcat7
ADD trucks/target/trucks.war  /var/lib/tomcat7/webapps/
