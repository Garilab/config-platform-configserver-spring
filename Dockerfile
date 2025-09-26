# Etapa de build
FROM gradle:7.5.1-jdk17 AS builder
WORKDIR /app
COPY build.gradle .
COPY settings.gradle .
COPY gradle/ gradle/
COPY src src
RUN gradle build -x test

# Etapa de runtime
FROM eclipse-temurin:17-jre AS runtime
WORKDIR /app
COPY --from=builder /app/build/libs/config-server-0.0.1-SNAPSHOT.jar /app/app.jar
EXPOSE 8888
ENTRYPOINT ["java","-jar","/app/app.jar"]
