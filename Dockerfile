# Christopher Neal's Project1 Dockerfile
FROM openjdk:12-alpine

COPY single-module/target/single-module-project.jar /single-module-project.jar

EXPOSE 8888

CMD ["java", "-jar", "/single-module-project.jar"]
