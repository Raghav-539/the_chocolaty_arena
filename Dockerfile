FROM tomcat:10.1-jdk21-temurin

LABEL maintainer="ChocolatyArena <chocolatyarena@oracle.com>"

EXPOSE 8080

COPY target/chocolaty-arena-app.war /usr/local/tomcat/webapps/ROOT.war
