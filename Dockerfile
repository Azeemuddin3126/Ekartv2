# Use the official Maven image as a base
FROM maven:3.8.6-openjdk-11 AS build

# Set working directory
WORKDIR /app

# Copy necessary files
COPY pom.xml .

# Download dependencies
RUN mvn dependency:go-offline -DskipTests

# Copy the rest of the application
COPY . .

# Build the application
RUN mvn package -Dmaven.test.skip=true

# Final stage
FROM openjdk:11-jre-slim

# Set working directory in the final image
WORKDIR /app

# Copy the built JAR from the build stage to the final image
COPY --from=build /app/target/*.jar /app/app.jar

# Command to run the application
CMD ["java", "-jar", "/app/app.jar"]
