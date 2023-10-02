# Dockerfile for building and running the boxfuse-sample-java-war-hello app
# Source link: https://github.com/boxfuse/boxfuse-sample-java-war-hello
FROM tomcat:10.1.13-jdk11
LABEL maintainer="artem.vakhitov@gmail.com"
RUN apt update
RUN apt install git maven -y
WORKDIR /tmp
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello
WORKDIR /tmp/boxfuse-sample-java-war-hello
RUN mvn package
RUN cp target/hello-1.0.war /var/lib/tomcat10/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]