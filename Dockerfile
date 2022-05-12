FROM openjdk:8
MAINTAINER Abhisek Datta <abhisek@appsecco.com>

RUN apt-get update
RUN apt-get install -y default-mysql-client
RUN apt-get install -y maven

#WORKDIR /app
WORKDIR /Documents/java_apps/dvja
COPY pom.xml pom.xml
RUN mvn dependency:resolve

COPY . .
RUN mvn clean package
#RUN chmod 755 /app/scripts/start.sh
RUN chmod 755 /Documents/java_apps/dvja/scripts/start.sh

EXPOSE 8080
#CMD ["sh", "-c", "/app/scripts/start.sh"]
CMD ["sh", "-c", "/Documents/java_apps/dvja/scripts/start.sh"]