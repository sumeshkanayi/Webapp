FROM ubuntu:14.04
MAINTAINER sumeshkanayi@gmail.com
RUN apt-get -y update
RUN apt-get -y install default-jdk tomcat7 wget
ENV CATALINA_BASE /var/lib/tomcat7
RUN ln -s /usr/share/tomcat7/bin/catalina.sh /usr/local/bin/catalina.sh
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 777 /docker-entrypoint.sh
#ADD trucks/target/trucks.war  /var/lib/tomcat7/webapps/
RUN wget https://devops_sumesh.jfrog.io/devops_sumesh/list/snapshot/com/companyname/automobile/trucks/1.0-SNAPSHOT/trucks-1.0-20171215.170559-3.war
COPY trucks-1.0-20171215.170559-3.war /var/lib/tomcat7/webapps/trucks.war
EXPOSE 8080
ENTRYPOINT ["/docker-entrypoint.sh"] 



