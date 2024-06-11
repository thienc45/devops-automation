FROM openjdk:17-jdk-alpine

WORKDIR /app

COPY .mvn/ .mvn
COPY mvnw pom.xml ./
COPY src ./src

RUN ./mvnw package -DskipTests

COPY target/devops-automation.jar devops-automation.jar

EXPOSE 8081

ENTRYPOINT ["java", "-jar", "devops-automation.jar"]
