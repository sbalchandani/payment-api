# Use a lightweight OpenJDK image
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the built jar from the target directory
COPY target/payment-api-*.jar app.jar

# Expose the port your app runs on
EXPOSE 8080

# Run the jar file
ENTRYPOINT ["java", "-jar", "app.jar"]

