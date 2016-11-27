FROM nexus:8084/tomcat
MAINTAINER sumeshkanayi@gmail.com
RUN apt-get -y update
RUN apt-get -y install nginx
ADD trucks/target/trucks.war  /tmp
