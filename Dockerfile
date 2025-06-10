# Use a lightweight OpenJDK image
FROM maven:3.8.3-openjdk-17 AS build

# Set the working directory
WORKDIR /app
COPY ./ /app

RUN mvn clean package

# Use a lightweight OpenJDK image
FROM openjdk:17-jdk-slim

# Copy the built jar from the target directory
COPY --from=build /app/target/*.jar app.jar

# Expose the port your app runs on
EXPOSE 8080

# Run the jar file
ENTRYPOINT ["java", "-jar", "app.jar"]

