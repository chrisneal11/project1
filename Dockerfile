# Christopher Neal's Project1 Dockerfile
FROM openjdk:12-alpine

COPY single-module/target/single*.jar /demo.jar

CMD ["java", "-jar", "/demo.jar"]
