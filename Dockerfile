FROM alpine:3.17
LABEL AUTHOR="Java Home"
RUN yum add openjdk17-jre
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.78/bin/apache-tomcat-9.0.78.tar.gz .
RUN tar xf apache-tomcat-9.0.78.tar.gz
RUN rm -rf apache-tomcat-9.0.78.tar.gz
RUN mv apache-tomcat-9.0.78 tomcat9
COPY target/hr-api.war /opt/tomcat9/webapps
EXPOSE 9000
CMD ["/opt/tomcat9/bin/catalina.sh", "run"]

