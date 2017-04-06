FROM ubuntu:14.04
MAINTAINER sumeshkanayi@gmail.com
RUN apt-get -y update
RUN apt-get -y install default-jdk tomcat7
ENV CATALINA_BASE /var/lib/tomcat7
RUN ln -s /usr/share/tomcat7/bin/catalina.sh /usr/local/bin/catalina.shq
ADD trucks/target/trucks.war  /var/lib/tomcat7/webapps/
EXPOSE 8080
CMD "catalina.sh run"
