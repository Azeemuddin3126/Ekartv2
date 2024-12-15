FROM openjdk:11-jdk-slim

EXPOSE 8085

COPY . .

ENTRYPOINT ["java","-Dserver.port=9090","-jar","/spring-boot-docker.jar"]