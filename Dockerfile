# Use a lightweight OpenJDK image
FROM maven:3.8-jdk-11 AS build

# Set the working directory
WORKDIR /app

RUN mvn clean package

# Use a lightweight OpenJDK image
FROM openjdk:17-jdk-slim

# Copy the built jar from the target directory
COPY target/payment-api-*.jar app.jar

# Expose the port your app runs on
EXPOSE 8080

# Run the jar file
ENTRYPOINT ["java", "-jar", "app.jar"]

