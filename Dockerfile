# syntax=docker/dockerfile:1
#Which "official Java image" ?
FROM openjdk:8
EXPOSE 8081
ADD target/devops-automation.jar devops-automation.jar
ENTRYPOINT ["java","-jar","/devops-automation.jar"]