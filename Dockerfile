FROM maven:3-eclipse-temurin-17 AS build
COPY . .
RUN mvn clean package -Dmaven.test.skip=true
FROM eclipse-temurin:17-alpine
COPY --from=build /target/demo-1.0.0.jar demo2.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "demo2.jar"]