FROM openjdk:11-jdk-slim

EXPOSE 8085

COPY . .

ENTRYPOINT ["java","-jar","/spring-boot-docker.jar"]