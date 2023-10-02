# Dockerfile for building and running the boxfuse-sample-java-war-hello app
# Source link: https://github.com/boxfuse/boxfuse-sample-java-war-hello
FROM ubuntu:18.04
LABEL maintainer="artem.vakhitov@gmail.com"
RUN apt update
RUN apt install git default-jdk maven tomcat8 -y
ENV CATALINA_HOME /usr/share/tomcat8
ENV PATH $CATALINA_HOME/bin:$PATH
RUN ln -s /var/lib/tomcat8/common $CATALINA_HOME/common
RUN ln -s /var/lib/tomcat8/server $CATALINA_HOME/server
RUN ln -s /var/lib/tomcat8/shared $CATALINA_HOME/shared
RUN ln -s /etc/tomcat8 $CATALINA_HOME/conf
RUN mkdir $CATALINA_HOME/temp
WORKDIR /tmp
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello
WORKDIR boxfuse-sample-java-war-hello
RUN mvn package
RUN cp target/hello-1.0.war /var/lib/tomcat8/webapps/
# A VM test shows that with a Tomcat config, we need 8080, not 8888 
EXPOSE 8080
CMD ["/usr/share/tomcat8/bin/catalina.sh", "run"]