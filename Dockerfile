# Dockerfile for building and running the boxfuse-sample-java-war-hello app
# Source link: https://github.com/boxfuse/boxfuse-sample-java-war-hello
FROM ubuntu:18.04
RUN apt update
# Do we really need VirtualBox if we don't use boxfuse itself?
RUN apt install git default-jdk maven virtualbox -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-springboot-hello
WORKDIR ./boxfuse-sample-java-springboot-hello
RUN mvn package
RUN cp target/hello-1.0.war /var/lib/tomcat8/webapps/
# A VM test shows that with a Tomcat config, we need 8080, not 8888 
EXPOSE 8080
CMD ["/usr/share/tomcat8/bin/catalina.sh", "run"]