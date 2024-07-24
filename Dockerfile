FROM maven:3.9.6-eclipse-temurin-17-alpine as build
COPY . .
RUN mvn clean package

FROM eclipse-temurin:17-jdk-alpine
VOLUME /tmp
COPY --from=build /target/*.jar  app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
