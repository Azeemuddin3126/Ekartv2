FROM openjdk:11

EXPOSE 8085

COPY . .

ENTRYPOINT ["java","-jar","/spring-boot-docker.jar"]