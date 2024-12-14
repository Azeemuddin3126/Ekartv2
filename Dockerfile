# Use an official OpenJDK image as the base
FROM openjdk:11

# Set the working directory to /app
WORKDIR /app

# Expose the application port (Ensure it matches the application's configured port)
EXPOSE 8085

# Copy the built JAR file from the workspace's target directory into the image
# This assumes the JAR file is named according to the Maven project's artifactId and version
COPY target/*.jar /app/application.jar

# Define the command to run the application
CMD ["java", "-jar", "/app/application.jar"]
