# Use a recent OpenJDK runtime as a parent image
FROM openjdk:17-jdk-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the Maven build files and source code
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
COPY src ./src

# Build the application
RUN ./mvnw package -DskipTests

# Copy the jar file into the container
COPY target/devops-automation.jar devops-automation.jar

# Make port 8081 available to the world outside this container
EXPOSE 8081

## Run the jar file
#ENTRYPOINT ["java", "-jar", "devops-automation.jar"]

CMD ["java", "-jar", "devops-automation.jar"]
